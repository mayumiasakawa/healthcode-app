class CreateOverviews < ActiveRecord::Migration[6.0]
  def change
    create_table :overviews do |t|
      t.references :user      ,null: false, foreign_key: true
      t.date :physicalfinding_measuring_date
      t.integer :weight
      t.integer :height
      t.integer :bmi
      t.integer :abdominal_circumference
      t.date :blood_urine_test_date
      t.date :medeical_care_date
      t.string :clinic_name
      t.string :disease_name
      t.string :treatment_medicine
      t.date :vaccine_date
      t.integer :vaccine_id
      t.timestamps
    end
  end
end
