class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.date :date_interviewed
      t.string :kind
      t.text :notes
      t.references :job, index: true

      t.timestamps
    end
  end
end
