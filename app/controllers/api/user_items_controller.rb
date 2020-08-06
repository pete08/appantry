class Api::UserItemsController < ApplicationController

  def index
    @user_items = UserItem.all
    render "index.json.jb"
  end

  def create
    UserItem.create(
      item_id: params[:item_id],
      user_id: params[:user_id],
      buy_date: params[:buy_date],
      used: false,
      future_interest: true
    )
    @user_item = UserItem.last
    render "show.json.jb"
  end

end
