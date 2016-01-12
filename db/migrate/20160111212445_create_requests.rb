class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :fan_id
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
