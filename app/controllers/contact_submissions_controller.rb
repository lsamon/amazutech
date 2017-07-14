class ContactSubmissionsController < ApplicationController
  def new
      @contact_submission = ContactSubmission.new
    end

    def create
      @contact_submission = ContactSubmission.new(contact_submission_params)
      if @contact_submission.save
        if ContactMailer.form_enquiry(@contact_submission).deliver_later
          flash.now[:error] = nil
          flash.now[:notice] = 'Thank you for your message!'
          redirect_to root_path
        else
          flash.now[:error] = 'Cannot send message.'
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end

  private
  def contact_submission_params
    params.fetch(:contact_submission, {}).permit(:name, :email, :subject, :message)
  end

end
