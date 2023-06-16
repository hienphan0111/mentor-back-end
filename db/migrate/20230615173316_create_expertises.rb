class CreateExpertises < ActiveRecord::Migration[7.0]
  def change
    create_table :expertises do |t|
      t.string :name 
      t.text :description
      t.binary :icon
      t.references :mentor, null: false, foreign_key: { to_table: :mentors }, index: true
      t.timestamps
    end
  end
end
