class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string   :name
<<<<<<< HEAD
      t.integer  :user_id
=======
      t.integer  :item_id
>>>>>>> 6c37f9050934652b7b792decad6aad3aaf1b207e
      t.datetime :created_at

      t.timestamps
    end
<<<<<<< HEAD
    add_index(:items, :user_id) #check if right
=======
>>>>>>> 6c37f9050934652b7b792decad6aad3aaf1b207e
  end
end
