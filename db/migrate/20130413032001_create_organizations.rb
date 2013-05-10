class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.string :contact_name

      t.timestamps
    end
  end
end
