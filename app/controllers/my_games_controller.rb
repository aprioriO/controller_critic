class MyGamesController < ApplicationController

  def index
    @my_games = current_user.my_games.includes(:games)
  end

  def create
    @game = Game.find(params[:game_id])
    my_game = MyGame.new(game: @game, user: current_user)

    if my_game.save
      redirect_to game_path(@game), notice: "Game added to your games."
    else
      redirect_to game_path(@game), alert: "Unable to add to your games."
    end
  end

  def destroy
    @my_game = MyGame.find(params[:id])
    @my_game.destroy
    redirect_back fallback_location: root_path, notice: "Game removed from My Games."
  end

end
