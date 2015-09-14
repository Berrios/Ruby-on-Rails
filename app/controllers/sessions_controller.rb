class SessionsController < ApplicationController
	def index
		render "sessions/index"
	end
	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])

			session[:user_id] = user.id
			session[:first_name] = user.first_name
			redirect_to "/songs"
		else
			flash[:error] = "Invalid Email or Password"
			redirect_to "/sessions"
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to "/sessions"
	end
end
