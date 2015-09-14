class PlaylistsController < ApplicationController
	def create
		Playlist.create(
			song_id: params[:song_id],
			user_id: params[:user_id]
			)
		redirect_to "/songs"
	end
end
