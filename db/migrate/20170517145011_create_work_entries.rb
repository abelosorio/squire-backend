class CreateWorkEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :work_entries do |t|
      t.date :entry_date
      t.string :client
      t.string :project
      t.integer :worked_hours

      t.timestamps
    end
  end
end
