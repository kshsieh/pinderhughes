class AddTimestampsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :created_at, :datetime
    add_column :tracks, :update_at, :datetime
  end
end
