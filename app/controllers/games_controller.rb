class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:like_game, :dislike_game, :add_favorite, :remove_favorite, :edit, :new ]
  before_action :set_game, only: [:show, :edit, :update, :destroy, :like_game, :dislike_game, :add_favorite, :remove_favorite ]


  # GET /games
  # GET /games.json
  def index
    if user_signed_in? && current_user.admin == true
      @games = Game.all
    else
      redirect_to root_path
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @category = @game.category
    @games = Game.lastest_twently_game
    @related =Game.related_game
  end

  # GET /games/new
  def new
    if user_signed_in? && current_user.admin == true
      @game = Game.new
    else
      redirect_to root_path
    end
  end

  # GET /games/1/edit
  def edit
    if current_user.admin != true
      raise("Page not found")
    end
  end

  def like_game
    @game.liked_by(current_user)

    redirect_to @game
  end

   def dislike_game
    @game.disliked_by(current_user)
    redirect_to @game
  end


  def add_favorite
    @game.add_favorite(current_user)
    redirect_to @game
  end

  def remove_favorite
    @game.remove_favorite(current_user)
    redirect_to @game
  end



  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render 'new'
    end

    # respond_to do |format|
    #   if @game.save
    #     format.html { redirect_to @game, notice: 'Game was successfully created.' }
    #     format.json { render :show, status: :created, location: @game }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @game.errors, status: :unprocessable_entity }
    #   end
    # end

  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:title, :image, :description, :release_date, :iframe, :source, :category_id)
    end
end
