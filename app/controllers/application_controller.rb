class ApplicationController < ActionController::Base
	helper_method :current_user

	def current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end

	def login(user)
		session[:user_id] = user.id

		puts "session id #{session[:user_id]}"
		@current_user = user
		redirect_to root_path
	end

	def logged_in?
		!current_user.nil?
	end

	def logout
		session.delete(:user_id)
  		@current_user = nil
	end
end
