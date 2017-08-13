class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :initialize_contact_submission, only: [:index, :submit_form]

  def index
    @latest_submission = ContactSubmission.by_ip(request.remote_ip)
  end

  def submit_form
    @contact_submission.contact_ip_address = request.remote_ip
    respond_to do |format|
      if @contact_submission.save
        if ContactMailer.form_enquiry(@contact_submission).deliver_later
          format.html { redirect_to root_path, notice: 'Message sent successfully!' }
          format.js   { }
          format.json { render :show, status: :created, location: @contact_submission }
        else
          redirect_to root_path, notice: 'Cannot send email'
        end
      else
        redirect_to root_path, notice: 'Cannot save contact message'
      end
    end
  end

  private
  def contact_submission_params
    params.fetch(:contact_submission, {}).permit(:name, :email, :subject, :message)
  end

  def initialize_contact_submission
    @contact_submission = ContactSubmission.new(contact_submission_params)
  end
end
