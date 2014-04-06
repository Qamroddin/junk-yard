class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :user_id
      t.boolean :status
      t.timestamps
    end
  end
end
