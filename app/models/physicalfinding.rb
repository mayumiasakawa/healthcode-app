class Physicalfinding < ApplicationRecord
  
  validates :measuring_date, presence: true
  validates :height_or_weight_or_abdominal, presence: true
  validates :height, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/}
  validates :weight, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/}
  validates :abdominal_circumference, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/}

  private
  def height_or_weight_or_abdominal
    :heigh.present? || :weight.present? || :abdominal_circumference.present?
  end

end
