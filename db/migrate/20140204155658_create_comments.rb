class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :content
      t.integer :item_id
      t.integer :user_id
      t.timestamps
    end

    add_index :comments, :item_id
    add_index :comments, :user_id
  end

  def self.down
  	drop_table :comments
  end

end
