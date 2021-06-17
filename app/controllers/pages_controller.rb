# frozen_string_literal: true

# PagesController
class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :init_contact_response, only: %i[index submit_form]

  def index
    @latest_response = ContactResponse.by_ip_address(request.remote_ip)
  end

  def submit_form
    @contact_response.contact_ip_address = request.remote_ip

    if captcha_validated || Rails.env.development?
      if verify_hcaptcha(model: @contact_response) && @contact_response.save
        ContactMailer.form_enquiry(@contact_response).deliver_later
        flash[:notice] = "Message sent successfully!"
      else
        flash[:error] = "Cannot save contact message"
      end
    else
      flash[:error] = captcha_response[:error_codes]
    end

    redirect_to root_path
  end

  private

  def contact_response_params
    params
      .fetch(:contact_response, {})
      .permit(:name, :email, :subject, :message, :ip_address)
  end

  def init_contact_response
    @contact_response = ContactResponse.new(contact_response_params)
  end
end
