class ChangeOriginIdInTableRelation < ActiveRecord::Migration
  def change
    rename_column :table_relations, :table_origin, :table_id
  end
end
