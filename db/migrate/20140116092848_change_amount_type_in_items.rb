class ChangeAmountTypeInItems < ActiveRecord::Migration
def self.up
   change_column :items, :amount, :string
  end

  def self.down
   change_column :items, :amount, :integer
  end
end
