class HomepageController < ApplicationController
  def index
    @games = Game.lastest_twently_game
    @weighted_average_game = Game.weighted_average_limit
  end

  def myprofile
  end

end
