class AddCachedVotesToGame < ActiveRecord::Migration
  def change
    add_column :games, :catched_voted_total, :integer, :default => 0
    add_column :games, :cached_votes_score, :integer, :default => 0
    add_column :games, :cached_votes_up, :integer, :default => 0
    add_column :games, :cached_votes_down, :integer, :default => 0
    add_column :games, :cach_weighted_score, :integer, :default => 0
    add_column :games, :cached_weighted_total, :integer, :default => 0
    add_column :games, :cached_weighted_average, :float, :default => 0.0
  end
end
