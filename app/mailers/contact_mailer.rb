class ContactMailer < ApplicationMailer
  def form_enquiry(contact)
    @contact = contact
    @email_subject = "Webform Enquiry"
    mail(to: 'loui.amon@gmail.com', subject: @email_subject)
  end
end
