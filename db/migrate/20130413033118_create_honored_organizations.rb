class CreateHonoredOrganizations < ActiveRecord::Migration
  def change
    create_table :honored_organizations do |t|
      t.integer :honored_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
