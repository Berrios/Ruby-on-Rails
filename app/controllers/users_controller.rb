class UsersController < ApplicationController
	def create
		user = User.create(
			first_name: params[:first_name],
			last_name: params[:last_name],
			email: params[:email],
			password: params[:password]
			)
		if user.errors.any?
			flash[:errors] = user.errors.full_messages
			redirect_to "/sessions"
		else
			redirect_to "/songs"
		end
	end

	def show
		@user = User.find(params[:id])
		@playlist = Playlist.where(:user_id => params[:id])

	  @song_count = []
		 @playlist.each do |p|
		 	 @song_count.push(p.song_id)
		 end
		puts @song_count
		render "users/show"
	end

	def update
		@user = User.find(params[:id])

		@user.first_name = "Erick"

		@user.save()
	end
end
