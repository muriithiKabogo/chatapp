class RoomsController < ApplicationController

  
  def index
    @current_user = current_user
    @room = Room.new
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @message = Message.new
    @messages = @single_room.messages
    @users = User.all_except(@current_user)
    @room = Room.new

    render "index"
  end

  def create
    @room = Room.create(name: params["room"]["name"])
  end
end
