class CreateDonationDetails < ActiveRecord::Migration
  def change
    create_table :donation_details do |t|
      t.integer :donation_id
      t.integer :organization_id
      t.decimal :amount

      t.timestamps
    end
  end
end
