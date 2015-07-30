class Game < ActiveRecord::Base
  belongs_to :category
  has_many :favorite_games
  has_many :favorited_by, through: :favorite_game, source: :user

  acts_as_votable

  validates :title, :image, :description, :iframe, :source, :category_id, presence: true

  mount_uploader :image, GameImageUploader

  scope :weighted_average_limit, ->{ all.order(cached_weighted_average: :DESC).limit(4) }
  scope :lastest_twently_game, -> { where('release_date <= ?', Date.today).order(created_at: :DESC).limit(20) }

  def add_favorite(user)
      user.favorites << self
  end

  def remove_favorite(user)
      user.favorites.delete(self)
  end

end
