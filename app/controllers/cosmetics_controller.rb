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

  def edit
    @cosmetic = Cosmetic.find(params[:id])
  end

  def update
    @cosmetic = Cosmetic.find(params[:id])
    @cosmetic.update(cosmetic_params)
    redirect_to cosmetic_path(@cosmetic.id), notice: '更新しました。'
  end

  def destroy
    @cosmetic = Cosmetic.find(params[:id])
    @cosmetic.destroy
    redirect_to cosmetics_path
  end

   private

  def cosmetic_params
    params.require(:cosmetic).permit(:item, :image, :description, :evaluation)
  end

end
