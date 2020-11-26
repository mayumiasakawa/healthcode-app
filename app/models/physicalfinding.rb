class Physicalfinding < ApplicationRecord
  
  validates :measuring_date, presence: true
  validates :hiegh_or_weight_or_abdominal, presence: true

  private
  def hiegh_or_weight_or_abdominal
    :heigh.present? || :weight.present? || :abdominal_circumference.present?
  end

end
