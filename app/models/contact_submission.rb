class ContactSubmission < ApplicationRecord
  validates :message, presence: true
  validates :email, email: true

  def self.by_ip(ip)
    ContactSubmission.where(contact_ip_address: ip).order('id').last
  end
end
