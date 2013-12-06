class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string   :name
      t.integer  :item_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
