class Api::GroceriesController < ApplicationController
  # before_action :authenticate_user 

  def index
    @user_items = UserItem.where(user_id: params[:id], used: "true", future_interest: "true") #UPDATE .where(user_id: current_user.id) for using log in requirement

    render "index.json.jb"
  end
  

end
