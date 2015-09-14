class SongsController < ApplicationController
	before_action :require_login, only: [:index]
	def index
		@songs = Song.all
		render "songs/index"
	end
	def create
		song = Song.create(
				title: params[:title],
				artist: params[:artist]
			)
		if song.errors.any?
			flash[:errors] = song.errors.full_messages
			redirect_to "/songs"
		else
			redirect_to "/songs"
		end
	end
	def show
		@song = Song.find(params[:id])
		@playlist = Playlist.where(:song_id => params[:id])
		@playlist.count
		render "songs/show"
	end
end
