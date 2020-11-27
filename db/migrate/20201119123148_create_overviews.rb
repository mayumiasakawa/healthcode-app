class CreateOverviews < ActiveRecord::Migration[6.0]
  def change
    create_table :overviews do |t|
      t.bigint :user_id             ,null: false, foreign_key: true
      t.bigint :physicalfinding_id  ,null: false, foreign_key: true
      t.bigint :clinicaltest_id     ,null: false, foreign_key: true
      t.bigint :vaccine_id          ,null: false, foreign_key: true
      t.bigint :medicalhistory_id   ,null: false, foreign_key: true
      t.timestamps
    end
  end
end 
