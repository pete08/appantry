class Api::UserItemsController < ApplicationController

  def index
    @user_items = UserItem.all
    render "index.json.jb"
  end

  def create
    name = (params[:name]).downcase
    p name
    UserItem.create(
      name: name,
      item_id: params[:item_id],
      user_id: params[:user_id],
      buy_date: Date.current,
      used: false,
      future_interest: true
    )
    @user_item = UserItem.last
    render "show.json.jb"
  end

end
