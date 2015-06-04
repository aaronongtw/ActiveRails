class CreateTableRelations < ActiveRecord::Migration
  def change
    create_table :table_relations do |t|
      t.integer :table_origin
      t.string :relationship
      t.string :through
      t.string :table_to

      t.timestamps null: false
    end
  end
end
