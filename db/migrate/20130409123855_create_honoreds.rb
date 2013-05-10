class CreateHonoreds < ActiveRecord::Migration
  def change
    create_table :honoreds do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.date :date_of_death
      t.string :city
      t.string :state
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
