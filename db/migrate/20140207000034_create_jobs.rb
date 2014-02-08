class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.string :company
      t.date :date_applied
      t.string :link
      t.text :description
      t.text :notes
      t.references :user, index: true

      t.timestamps
    end
  end
end
