class Api::CooksController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id, use: "") 
    # @recipes = @recipes.sort_by &:title
    p @recipes
    render "index.json.jb"
  end
  def update
    @recipes = Recipe.where(user_id: current_user.id) 

    @recipes = @recipes.find_by(id: params[:id])
    @recipes.update(
      used: params[:use] || @recipes.use,
    )
  end
end
