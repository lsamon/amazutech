class PagesController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/js' }
  before_action :find_contact_submission, only: [:index]

  def index
  end

  private
  def find_contact_submission
    @latest_submission = ContactSubmission.by_ip(request.remote_ip)
  end
end
