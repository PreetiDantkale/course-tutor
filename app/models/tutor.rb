class Tutor < ApplicationRecord
  belongs_to :course
  validates :name, :email, :phone, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :status, presence: true, inclusion: { in: %w(active inactive) }
end
