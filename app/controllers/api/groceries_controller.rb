class Api::GroceriesController < ApplicationController
  # before_action :authenticate_user 

  def index
    p "*" * 45
    p "current_user: "
    p current_user
    p "*" * 45
    p "*" * 45
    p "current_user.email: "
    p current_user.email
    p "*" * 45
    p "*" * 45
    p "current_user.id: "
    p current_user.id
    p "*" * 45
    @user_items = UserItem.where(user_id: current_user.id, used: "true", future_interest: "true") #UPDATE .where(user_id: current_user.id) for using log in requirement -------------------------------------------------------------------

    render "index.json.jb"
  end
  

end
