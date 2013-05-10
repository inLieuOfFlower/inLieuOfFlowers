class ChangeColumnsToOrganizations < ActiveRecord::Migration
  def change
  	change_column :organizations, :name, :string, :null => false
  	change_column :organizations, :street, :string, :null => false
  	change_column :organizations, :city, :string, :null => false
  	change_column :organizations, :state, :string, :null => false
  	change_column :organizations, :zip, :string, :null => false
  	change_column :organizations, :phone, :string, :null => false
  	change_column :organizations, :email, :string, :null => false
  	change_column :organizations, :contact_name, :string, :null => false
  	change_column :organizations, :status, :string, :default => "pending", :null => false
  end
end
