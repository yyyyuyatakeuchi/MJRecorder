class CreateScoreSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :score_settings do |t|
      t.float :result_point
      t.integer :match_count
      t.integer :rank
      t.float :rate
      t.integer :base_point
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
