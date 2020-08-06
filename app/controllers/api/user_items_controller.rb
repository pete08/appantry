class Api::UserItemsController < ApplicationController

  def index
    @user_items = UserItem.all
    render "index.json.jb"
  end

end
