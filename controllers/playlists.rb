# helpers
helpers do
  def get_songs_not_in_playlist(playlist)
    playlist.songs.length > 0 ?
    Song.where("id NOT IN (?)", @playlist.songs.map(&:id)).order(:title) :
    Song.order(:title)
  end
end

# index
get "/playlists" do
  @playlists = Playlist.order(:name)
  erb(:"playlists/index")
end

# new
get "/playlists/new" do
  erb(:"playlists/new")
end

# create
post "/playlists" do
  @playlist = Playlist.create!(params[:playlist])
  redirect("/playlists/#{@playlist.id}")
end

# show
get "/playlists/:id" do
  @playlist = Playlist.find(params[:id])
  erb(:"playlists/show")
end

# add song
post "/playlists/:id/add_song" do
  @playlist = Playlist.find(params[:id])
  @playlist.songs << Song.find(params[:song_id])
  redirect("/playlists/#{@playlist.id}")
end

# remove song
get "/playlists/:id/remove_song/:song_id" do
  @playlist = Playlist.find(params[:id])
  @playlist.songs.delete(Song.find(params[:song_id]))
  redirect("/playlists/#{@playlist.id}")
end

# destroy
delete "/playlists/:id" do
  @playlist = Playlist.find(params[:id])
  @playlist.destroy
  redirect to("/playlists")
end
