class DefaultController < ApplicationController
  def index
    @users = User.all
    @items = Item.count
  end
end
