class Overview < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :vaccine

  belongs_to :user, optional: true
  has_one_attached :image

  validates :physicalfinding_measuring_date, presence: true,if: -> { (height.present? || weight.present? || abdominal_circumference.present?) ||
                                                                     (blood_urine_test_date.blank? && medeical_care_date.blank? && vaccine_date.blank?) }
  validates :height, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/},
             presence: true, if: -> { physicalfinding_measuring_date.present? && weight.present? && abdominal_circumference.present? }
  validates :weight, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/},
             presence: true, if: -> { physicalfinding_measuring_date.present? && height.present? && abdominal_circumference.present? }
  validates :abdominal_circumference, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/},
             presence: true, if: -> { physicalfinding_measuring_date.present? && height.present? && weight.present? }

  validates :blood_urine_test_date,
             presence: true, if: :was_attached?, if: -> { (image.present?) || (physicalfinding_measuring_date.blank? && medeical_care_date.blank? && vaccine_date.blank?) }
  validates :image,
             presence: true, if: -> { blood_urine_test_date.present? }
            
  validates :medeical_care_date,
             presence: true, if: -> { (clinic_name.present? && disease_name.present? && treatment_medicine.present?) ||
                                      (physicalfinding_measuring_date.blank? && blood_urine_test_date.blank? && vaccine_date.blank?) }
  validates :clinic_name,
            presence: true, if: -> { medeical_care_date.present? && disease_name.present? && treatment_medicine.present? }
  validates :disease_name,
            presence: true, if: -> { medeical_care_date.present? && clinic_name.present? && treatment_medicine.present? }
  validates :treatment_medicine,
            presence: true, if: -> { medeical_care_date.present? && clinic_name.present? && disease_name.present? }

  validates :vaccine_date,
             presence: true, unless: -> { vaccine_id.nil? },
                             if: -> { physicalfinding_measuring_date.blank? && blood_urine_test_date.blank? && medeical_care_date.blank? }
                             
  validates :vaccine_id, numericality: { other_than: 1 } ,
             presence: true, if: -> { vaccine_date.present? }


  def was_attached?
    self.image.attached?
  end

end
