class AddColumnToDonations < ActiveRecord::Migration
  def change
  	add_column :donations, :honored_id, :integer
  end
end
