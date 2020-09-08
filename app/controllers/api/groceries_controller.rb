class Api::GroceriesController < ApplicationController
  before_action :authenticate_user 

  def index

    @user_items = UserItem.where(user_id: current_user.id, used: "true", future_interest: "true") 
    @user_items = @user_items.sort_by &:name
    p @user_items
    render "index.json.jb"
  end
  
  def show
    @user_item = UserItem.find_by(id: params[:id])
    p "*" * 45
    p "*" * 45
    p @user_item
    p "*" * 45
    p "*" * 45
    render "show.json.jb"
  end

  def create
    name = (params[:name]).downcase
    item = Item.find_by(name: params[:name])
    UserItem.create(
      name: name,
      item_id: item.id,
      user_id: current_user.id,
      buy_date: Date.current,
      used: true,
      future_interest: true
    )
    @user_item = UserItem.last
    render "show.json.jb"
  end

  def update
    p current_user
    @user_items = UserItem.where(user_id: current_user.id) 

    @user_item = @user_items.find_by(id: params[:id])

    @user_item.update(
      used: params[:used], #|| @user_item.used,
      future_interest: params[:future_interest] || @user_item.future_interest
    )
    p "@user_item:"
    p @user_item
    p "*" * 45
    p "*" * 45
  
    p "@user_item.used:"
    p @user_item.used
    p "*" * 45
    p "*" * 45
    p "End" * 80

    p "*" * 45
  
    render "show.json.jb"
  end

end
