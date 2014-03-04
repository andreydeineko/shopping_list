class CreateComments < ActiveRecord::Migration
def change
    create_table :comments do |t|
    t.string   :content
    t.integer  :item_id
    t.integer  :user_id
    t.datetime :created_at
    t.datetime :updated_at
    t.string   :ancestry


      t.timestamps
    end
    add_index(:comments, :item_id)
    add_index(:comments, :ancestry)
  end

end
