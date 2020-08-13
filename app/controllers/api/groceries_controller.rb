class Api::GroceriesController < ApplicationController
  before_action :authenticate_user

  def index
    @user_items = UserItem.where(user_id: current_user.id, used: "true", future_interest: "true")

    render "index.json.jb"
  end
  

end
