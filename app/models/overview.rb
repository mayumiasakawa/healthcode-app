class Overview < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :vaccine

  belongs_to :user, optional: true
  has_one_attached :image

  
  with_options presence: true do
    
    validates :physicalfinding_measuring_date, 
                if: -> { (height.present? || weight.present? || abdominal_circumference.present?) ||
                         (blood_urine_test_date.blank? && medical_care_date.blank? && vaccine_date.blank?) }
    validates :height, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/},
               if: -> { physicalfinding_measuring_date.present? && weight.blank? && abdominal_circumference.blank? && bmi.blank? }
    validates :weight, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/},
               if: -> { physicalfinding_measuring_date.present? && height.blank? && abdominal_circumference.blank? && bmi.blank? }
    validates :abdominal_circumference, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }, format: {with: /\A[0-9]+\z/},
               if: -> { physicalfinding_measuring_date.present? && height.blank? && weight.blank? && bmi.blank? }
    validates :bmi, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 40 }, format: {with: /\A[0-9]+\z/},
               if: -> { physicalfinding_measuring_date.present? && height.blank? && weight.blank? && abdominal_circumference.blank? }
  
    validates :blood_urine_test_date,
              if: -> { physicalfinding_measuring_date.blank? && medical_care_date.blank? && vaccine_date.blank? },
              if: :was_attached?
    validates :image,if: -> { blood_urine_test_date.present? }
              
    validates :medical_care_date,
               if: -> { (clinic_name.present? && disease_name.present? && treatment_medicine.present?) ||
                        (physicalfinding_measuring_date.blank? && blood_urine_test_date.blank? && vaccine_date.blank?) }
    validates :clinic_name,length: { maximum: 40 },
              if: -> { medical_care_date.present? || disease_name.present? || treatment_medicine.present? }
    validates :disease_name,length: { maximum: 60 },
              if: -> { medical_care_date.present? || clinic_name.present? || treatment_medicine.present? }
    validates :treatment_medicine,length: { maximum: 60 },
               if: -> { medical_care_date.present? || clinic_name.present? || disease_name.present? }
  
    validates :vaccine_date,if: -> { physicalfinding_measuring_date.blank? && blood_urine_test_date.blank? && medical_care_date.blank? },
                            if: :vaccine_type?
                               
    validates :vaccine_id, numericality: { other_than: 1 },if: -> { vaccine_date.present? }

 end


  def was_attached?
    self.image.attached?
  end

  def vaccine_type?
    vaccine_id.to_i > 1
  end

end
