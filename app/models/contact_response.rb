# frozen_string_literal: true

# For collecting information from the contact form
class ContactResponse < ApplicationRecord
  validates :name, :email, :message, presence: true

  def self.by_ip_address(ip)
    where(ip_address: ip).last
  end
end
