class Song < ActiveRecord::Base
	has_many :playlists
	has_many :users_added, through: :playlists, source: :user
	validates :artist, :title, presence: true, length: { minimum: 2 }
end
