class AddRankToRawScores < ActiveRecord::Migration[6.1]
  def change
    add_column :raw_scores, :rank, :integer
  end
end
