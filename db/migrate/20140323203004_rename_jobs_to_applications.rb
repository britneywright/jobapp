class RenameJobsToApplications < ActiveRecord::Migration
  def change
    rename_table :jobs, :applications
  end

  rename_column :interviews, :job_id, :application_id
end
