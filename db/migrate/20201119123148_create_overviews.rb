class CreateOverviews < ActiveRecord::Migration[6.0]
  def change
    create_table :overviews do |t|
      t.string :allergies
      t.string :alcohol
      t.string :cigratte
      t.references :user  ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
