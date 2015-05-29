class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :database_id

      t.timestamps null: false
    end
  end
end
