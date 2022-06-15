class CosmeticsController < ApplicationController

  def new
    @cosmetic = Cosmetic.new
  end

  def create
    @cosmetic = Cosmetic.new(cosmetic_params)
    @cosmetic.user_id = current_user.id
    @cosmetic.save
    redirect_to cosmetics_path
  end

  def index
    @cosmetics = Cosmetic.all
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
  end

  def destroy
    @cosmetic = Cosmetic.find(prams[:id])
    @cosmetic.destroy
    redirect_to cosmetics_path
  end

   private

  def cosmetic_params
    params.require(:cosmetic).permit(:item, :image, :description)
  end
end
