class Game < ActiveRecord::Base
  belongs_to :category
  has_many :favorite_games
  has_many :favorited_by, through: :favorite_game, source: :user

  acts_as_votable

  mount_uploader :image, GameImageUploader
end
