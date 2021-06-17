# frozen_string_literal: true

# ContactResponsesController
class ContactResponsesController < ApplicationController
  def create
    @contact_response = ContactResponse.new(contact_response_params)

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
end
