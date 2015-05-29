class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
