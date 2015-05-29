class AddTablenumToDatabases < ActiveRecord::Migration
  def change
    add_column :databases, :Tablenum, :integer
    rename_column :tables, :fields, :fieldnum
  end
end
