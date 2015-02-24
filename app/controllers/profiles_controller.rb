class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items.just_active
  end
end
