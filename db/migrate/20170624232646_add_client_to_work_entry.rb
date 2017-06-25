class AddClientToWorkEntry < ActiveRecord::Migration[5.1]
  def change
    remove_column :work_entries, :client, :string
    add_reference :work_entries, :client, foreign_key: true
  end
end
