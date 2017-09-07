class ContactSubmission < ApplicationRecord
  attr_accessor :comment # fake attribute used for spam trapping

  validates :message, presence: true
  validates :email, email: true
  validates_length_of :comment, :in => 0..1

  def self.by_ip(ip)
    ContactSubmission.where(contact_ip_address: ip).order('id').last
  end
end
