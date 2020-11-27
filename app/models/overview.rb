class Overview < ApplicationRecord

  belongs_to :user, optional: true

  validates :measuring_date, presence: true
  validates :height, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/}, presence: true, if: -> { weight.blank? && abdominal_circumference.blank? }
  validates :weight, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/}, presence: true, if: -> { height.blank? && abdominal_circumference.blank? }
  validates :abdominal_circumference, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/}, presence: true, if: -> { height.blank? && weight.blank? }

end
