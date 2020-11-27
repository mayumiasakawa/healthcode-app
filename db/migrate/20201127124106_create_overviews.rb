class CreateOverviews < ActiveRecord::Migration[6.0]
  def change
    create_table :overviews do |t|
      t.references :user      ,null: false, foreign_key: true
      t.date :measuring_date
      t.integer :weight
      t.integer :height
      t.integer :abdominal_circumference
      t.timestamps
    end
  end
end
