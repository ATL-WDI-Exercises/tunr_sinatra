# index
get "/songs" do
  @search_title = params[:title]
  @songs = @search_title ?
           Song.where("lower(title) LIKE (?)", "%#{@search_title.downcase}%") :
           Song.all
  erb(:"songs/index")
end

# new
get "/songs/new" do
  erb(:"songs/new")
end

# create
post "/songs" do
  @song = Song.create!(params[:song])
  redirect("/songs/#{@song.id}")
end

#show
get "/songs/:id" do
  @song = Song.find(params[:id])
  erb(:"songs/show")
end

# edit
get "/songs/:id/edit" do
  @song = Song.find(params[:id])
  erb(:"songs/edit")
end

# update
put "/songs/:id" do
  @song = Song.find(params[:id])
  @song.update(params[:song])
  redirect("/songs/#{@song.id}")
end

# destroy
delete "/songs/:id" do
  @song = Song.find(params[:id])
  @song.destroy
  redirect to("/songs")
end
