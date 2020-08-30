class Api::UserItemsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @user_items = UserItem.where(user_id: current_user.id) 
    p "*" * 45
    @user_items = @user_items.where(used: "false", future_interest: "true")
    p "*" * 45
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
      used: false,
      future_interest: true
    )
    @user_item = UserItem.last
    render "show.json.jb"
  end

  def update
    @user_items = UserItem.where(user_id: current_user.id) 
    p "*" * 45
    p "*" * 45
    p "@user_items:" 
    p @user_items
    p "*" * 45
    p "*" * 45
    @user_item = @user_items.find_by(id: params[:id])
    p "*" * 45
    p "*" * 45
    p "@user_item:" 
    p @user_item
    p "*" * 45
    p "*" * 45
    p "@user_item.future_interest:" 
    p @user_item.future_interest
    p "*" * 45
    p "*" * 45
    p "@user_item.used:"
    p @user_item.used
    p "*" * 45
    p "*" * 45
    p "params[:used]: "
    p params[:used]
    p "*" * 45
    p "*" * 45
    p "params[:future_interest]: "
    p params[:future_interest]
    p "*" * 45
    p "*" * 45
    p "*" * 45
    p "*" * 45

    @user_item.update(
      used: params[:used] || @user_item.used,
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
  
    render "show.json.jb"
  end

  def destroy
    item = UserItem.find_by(id: params[:id])
    name = item.name
    item.destroy

    render json: {delete: "Deletion of item success", item: name}
  end

end
