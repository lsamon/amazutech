class ContactSubmission < ApplicationRecord
  validates :message, presence: true
  validates :email, email: true
end
