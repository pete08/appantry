class Api::ItemsController < ApplicationController


  def index
    render json: {message: "howdy from index action in items controller!"}
  end





end