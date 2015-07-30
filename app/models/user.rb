class User < ActiveRecord::Base

  acts_as_voter

  has_many :favorite_games
  has_many :favorites, through: :favorite_games, source: :game
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profilepicture, ProfilepictureUploader

end

