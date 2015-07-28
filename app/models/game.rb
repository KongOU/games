class Game < ActiveRecord::Base
  belongs_to :category
  mount_uploader :image, GameImageUploader
end
