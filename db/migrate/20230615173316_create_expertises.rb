class CreateExpertises < ActiveRecord::Migration[7.0]
  def change
    create_table :expertises do |t|
      t.string :name 
      t.text :description
      t.text :icon

      t.timestamps
    end
  end
end
