class ChangeColumnsToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :first_name, :string, :null => false
  	change_column :users, :last_name, :string, :null => false
  	change_column :users, :street, :string, :null => false
  	change_column :users, :city, :string, :null => false
  	change_column :users, :state, :string, :null => false
  	change_column :users, :zip, :string, :null => false
  	change_column :users, :phone, :string, :null => false
  	change_column :users, :administrator, :boolean, :default => false, :null => false
  end
end
