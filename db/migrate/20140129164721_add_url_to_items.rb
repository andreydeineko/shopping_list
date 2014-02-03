class AddUrlToItems < ActiveRecord::Migration
  def change
    add_column :items, :URL, :string
  end
end
