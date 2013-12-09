class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string   :name
      t.string   :url
      t.integer  :user_id
      t.datetime :created_at


      t.timestamps
    end
    add_index(:items, :user_id) #check if right
  end
end
