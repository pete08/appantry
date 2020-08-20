class Api::UserItemsController < ApplicationController
  # before_action :authenticate_user
  
  def index
    @user_items = UserItem.where(user_id: params[:id]) #UPDATE .where(user_id: current_user.id) for using log in requirement
    render "index.json.jb"
  end
  
  def create
    name = (params[:name]).downcase
    UserItem.create(
      name: name,
      item_id: params[:item_id],
      user_id: current_user.id,
      buy_date: Date.current,
      used: false,
      future_interest: true
    )
    @user_item = UserItem.last
    render "show.json.jb"
  end

  def update
    @user_items = UserItem.where(user_id: params[:id]) #UPDATE .where(user_id: current_user.id) for using log in requirement
    @user_item = @user_items.find_by(id: params[:id])
    p @user_item
    @user_item.update(
      used: params[:used] || @user_item.used,
      future_interest: params[:future_interest] || @user_item.future_interest
    )
    render "show.json.jb"
  end

end
