class CosmeticsController < ApplicationController

  def new
    @cosmetic = Cosmetic.new
  end

  def create
    @cosmetic = Cosmetic.new(cosmetic_params)
    @cosmetic.user_id = current_user.id
    if @cosmetic.save
      redirect_to cosmetics_path
    else
      render :new
    end
  end

  def index
    @cosmetics = Cosmetic.page(params[:page])
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
    @cosme_comment = CosmeComment.new
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
