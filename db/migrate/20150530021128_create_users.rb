class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest


      t.timestamp
    end
    add_column :databases, :user_id, :integer
  end
end
