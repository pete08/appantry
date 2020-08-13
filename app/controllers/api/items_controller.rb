class Api::ItemsController < ApplicationController


  def index
    @items = Item.all
    render "index.json.jb"
  end

  def show
    @item = Item.find_by(id: params[:id])
    p @item
    render "show.json.jb"
  end



end