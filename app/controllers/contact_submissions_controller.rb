class ContactSubmissionsController < ApplicationController
  before_action :initialize_contact_submission

  def create
    respond_to do |format|
      if @contact_submission.save
        format.js
      else
        format.html { redirect_to root_path }
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
