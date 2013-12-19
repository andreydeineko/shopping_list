class AddCachedVotesToItems < ActiveRecord::Migration
  def change
    add_column :items, :cached_votes_total, :integer
    add_index :items, :cached_votes_total
    add_column :items, :cached_votes_score, :integer
    add_index :items, :cached_votes_score
    add_column :items, :cached_votes_up, :integer
    add_index :items, :cached_votes_up
    add_column :items, :cached_votes_down, :integer
    add_index :items, :cached_votes_down
    add_column :items, :cached_weighted_score, :integer
    add_index :items, :cached_weighted_score
  end
end
