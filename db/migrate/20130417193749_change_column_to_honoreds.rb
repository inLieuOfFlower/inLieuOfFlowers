class ChangeColumnToHonoreds < ActiveRecord::Migration
  def change
  	change_column :honoreds, :first_name, :string, :null => false
  	change_column :honoreds, :last_name, :string, :null => false
  	add_column :honoreds, :status, :string, :default => 'pending', :null => false
  end
end
