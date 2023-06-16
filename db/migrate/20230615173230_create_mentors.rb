class CreateMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :mentors do |t|
      t.string :name
      t.text :bio
      t.binary :photo
      t.string :contact

      t.timestamps
    end
  end
end
