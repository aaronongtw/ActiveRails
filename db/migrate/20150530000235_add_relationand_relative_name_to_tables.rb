class AddRelationandRelativeNameToTables < ActiveRecord::Migration
  def change
    add_column :tables, :relation, :string
    add_column :tables, :relativename, :string
  end
end
