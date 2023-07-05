class SessionsController < ApplicationController
  
  def new
    
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      login(user)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path
  end

end
