class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :initialize_contact_submission, only: [:index]

  def index
    @latest_submission = ContactSubmission.by_ip(request.remote_ip)
  end

  private
  def contact_submission_params
    params.fetch(:contact_submission, {}).permit(:name, :email, :subject, :message)
  end

  def initialize_contact_submission
    @contact_submission = ContactSubmission.new(contact_submission_params)
  end
end
