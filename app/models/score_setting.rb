class ScoreSetting < ApplicationRecord
  belongs_to :user
  has_many :raw_scores, dependent: :destroy 
end
