class AddColumnToTables < ActiveRecord::Migration
  def change
    add_column :tables, :through, :string
  end
end
