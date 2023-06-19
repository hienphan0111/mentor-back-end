class CreateExpertisesMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :expertises_mentors do |t|
      t.references :expertise, null: false, foreign_key: true
      t.references :mentor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
