class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thx you! #{@user.name}"
    else
      render :new
    end
  end

  def search
    if params[:item]
      Item.search(params[:item])
      render 'show'
    else
      redirect_to @user, notice: "nothing to show"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
