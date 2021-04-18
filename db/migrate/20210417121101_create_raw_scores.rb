class CreateRawScores < ActiveRecord::Migration[6.1]
  def change
    create_table :raw_scores do |t|
      t.float :score
      t.references :score_setting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
