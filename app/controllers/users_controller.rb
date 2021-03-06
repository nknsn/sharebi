class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to cosmetics_path
    else
      render 'new'
    end
  end


  def show
    @user = User.find(params[:id])
    @cosmetics = @user.cosmetics.page(params[:page])
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user), notice: '更新しました。'
  end

    private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image, :introduction,
    :working_place, :skin_type, :affiliation)
  end

end

