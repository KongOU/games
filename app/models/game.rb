class Game < ActiveRecord::Base
  belongs_to :category

  acts_as_votable

  mount_uploader :image, GameImageUploader
end
