class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  has_many :score_settings, dependent: :destroy
  has_many :raw_scores, through: :score_settings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
