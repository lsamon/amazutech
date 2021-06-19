# frozen_string_literal: true

# PagesController
class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :init_contact_response, only: %i[index submit_form]

  def index
    @latest_response = ContactResponse.by_ip_address(request.remote_ip)
  end

  def submit_form
    @contact_response.ip_address = request.remote_ip

    if Rails.env.development? && @contact_response.save
      return send_email_redirect
    end

    if verify_hcaptcha(model: @contact_response) && @contact_response.save
      return send_email_redirect
    end

    flash[:alert] = "Could not send message at this time. please try again later"

    redirect_to root_path
  end

  private

  def contact_response_params
    params
      .fetch(:contact_response, {})
      .permit(:name, :email, :subject, :message)
  end

  def init_contact_response
    @contact_response = ContactResponse.new(contact_response_params)
  end

  def send_email_redirect
    ContactMailer.form_enquiry(@contact_response).deliver_now
    flash[:notice] = "Message sent successfully!"
    redirect_to root_path
  end
end
