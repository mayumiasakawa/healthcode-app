class CreatePhysicalfindings < ActiveRecord::Migration[6.0]
  def change
    create_table :physicalfindings do |t|
      t.date :measuring_date
      t.integer :weight
      t.integer :height
      t.integer :abdominal_circumference
      t.timestamps
    end
  end
end
