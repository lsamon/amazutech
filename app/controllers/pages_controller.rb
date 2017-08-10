class PagesController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/js' }
  before_action :find_contact_submission, :initialize_contact_submission, only: [:index]

  def index
  end

  private
  def contact_submission_params
    params.fetch(:contact_submission, {}).permit(:name, :email, :subject, :message)
  end
  
  def initialize_contact_submission
    @contact_submission = ContactSubmission.new(contact_submission_params)
  end

  def find_contact_submission
    @latest_submission = ContactSubmission.by_ip(request.remote_ip)
  end
end
