class ItemsController < ApplicationController
  before_filter :authorize
  before_filter :find_user, only: [:new, :create, :index, :show, :edit, :update]

  def index
    if params[:item]
      @items = @user.items.where('media_item LIKE ?', "%#{params[:item]}")
    else
      redirect_to user_path(@user)
    end
  end

  def new
    @item = @user.items.build
  end

  def create
    @item = @user.items.build(item_params)
    if @item.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @item = @user.items.find(params[:id])
  end

  def edit
    @item = @user.items.find(params[:id])
  end

  def update
    @item = @user.items.find(params[:id])
    if @item.update(item_params)
      redirect_to user_item_path(@user, @item)
    else
      render :edit
    end

  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end

  def item_params
    params.require(:item).permit(:media_item, :active)
  end
end
