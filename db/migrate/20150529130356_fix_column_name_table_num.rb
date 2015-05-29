class FixColumnNameTableNum < ActiveRecord::Migration
  def change
    rename_column :databases, :Tablenum, :tablenum
  end
end
