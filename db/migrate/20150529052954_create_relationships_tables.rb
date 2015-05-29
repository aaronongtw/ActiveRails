class CreateRelationshipsTables < ActiveRecord::Migration
  def change
    create_table :relationships_tables do |t|
        t.integer :relationship_id
        t.integer :table_id
    end
  end
end
