class AddContactEmailToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :contact_email, :string
  end
end
