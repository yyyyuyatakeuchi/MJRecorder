class RemoveRankFromScoreSettings < ActiveRecord::Migration[6.1]
  def change
    remove_column :score_settings, :rank, :integer
  end
end
