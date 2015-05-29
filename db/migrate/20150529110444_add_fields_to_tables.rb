class AddFieldsToTables < ActiveRecord::Migration
  def change
    add_column :tables, :fields, :integer
  end
end
