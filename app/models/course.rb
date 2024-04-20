class Course < ApplicationRecord
  has_many :tutors
  validates :name, :start_date, :end_date, presence: true
  validates :code, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: %w(active inactive) }
  validates :price, :max_capacity, presence: true, numericality: { greater_than: 0 }
  accepts_nested_attributes_for :tutors
end
