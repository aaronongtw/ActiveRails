class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :fields, :type, :fieldtype
  end
end
