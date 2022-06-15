class FavoritesController < ApplicationController

  def create
    cosmetic = Cosmetic.find(params[:cosmetic_id])
    favorite = current_user.favorites.new(cosmetic_id: cosmetic.id)
    favorite.save
    redirect_to cosmetic_path(cosmetic)
  end

  def destroy
    cosmetic = Cosmetic.find(params[:cosmetic_id])
    favorite = current_user.favorites.find_by(cosmetic_id: cosmetic.id)
    favorite.destroy
    redirect_to cosmetic_path(cosmetic)
  end

end
