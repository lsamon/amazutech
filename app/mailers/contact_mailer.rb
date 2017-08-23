class ContactMailer < ApplicationMailer
  def form_enquiry(contact)
    @contact = contact
    attachments.inline['logo_thumbnail.png'] = File.read('app/assets/images/logo_thumbnail.png')
    @email_subject = "Webform Enquiry"
    mail(to: 'loui.amon@gmail.com', subject: @email_subject)
  end
end
