class AddContactInfoToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :contact_name, :string
    add_column :jobs, :contact_phone, :string
    add_column :jobs, :contact_address, :text
  end
end
