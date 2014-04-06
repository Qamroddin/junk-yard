class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :avatar
      t.integer :user_id
      t.boolean :profile_picture
      t.timestamps
    end
  end
end
