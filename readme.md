<!--
This file is auto-generated from a 'template.md'
file using the 'md-process' script.
Therefore *DO NOT* edit this file directly!
Instead edit 'template.md' and then run 'md-process'.
-->

# Tunr Sinatra App

We are going to build the world's #1 music web app!

## Table of Contents

* [Specifications](#specifications)
  * [Schema](#schema)
  * [Use Cases](#use-cases)
* [Instructions for Building The App](#instructions-for-building-the-app)
  * [Step 1 - Create The Project Directory](#step-1---create-the-project-directory)
  * [Step 2 - Create and Seed the Database](#step-2---create-and-seed-the-database)
  * [Step 3 - Create the Model Classes](#step-3---create-the-model-classes)
  * [Step 4 - Seed the Database using the Model Classes](#step-4---seed-the-database-using-the-model-classes)
  * [Step 5 - Create the Controllers](#step-5---create-the-controllers)
  * [Step 6 - Create the Main App File](#step-6---create-the-main-app-file)
  * [Step 7 - Create the Layout and Home View](#step-7---create-the-layout-and-home-view)
  * [Step 8 - Create the Artist Views](#step-8---create-the-artist-views)
  * [Step 9 - Create the Song Views](#step-9---create-the-song-views)
  * [Step 10 - Add the CSS](#step-10---add-the-css)
  * [Step 11 - Create a Gemfile and run Bundler](#step-11---create-a-gemfile-and-run-bundler)
  * [Step 12 - Test it out](#step-12---test-it-out)
* [Bonuses](#bonuses)

## Specifications

Tunr provides a RESTful web interface to Songs and Artists.

### Schema

* artists
  * id
  * name
  * photo_url
  * nationality

* songs
  * id
  * title
  * album
  * preview_url
  * artist_id

### Use Cases

For Artists, a user should be able to:
  * view a list of all artists
  * view detailed information on a specific artist
    * that page should list all songs by the artist
  * add a new artist
  * edit an existing artist
  * delete a artist

For Songs, a user should be able to:
  * view a list of all songs
  * view detailed information on a specific song
  * add a new song (using the artist_id # to connect it to an artist
  * edit an existing song
  * delete a song

## Instructions for Building The App

### Step 1 - Create The Project Directory

```bash
cd ~/ga/wdi/exercises
mkdir tunr_sinatra
cd tunr_sinatra
```

### Step 2 - Create and Seed the Database

2a. Create the `tunr_sinatra` database:

```bash
dropdb tunr_sinatra
createdb tunr_sinatra
mkdir db
touch db/schema.sql
```

2b. Set the contents of `db/schema.sql` to the following:

```sql
DROP TABLE IF EXISTS songs   CASCADE;
DROP TABLE IF EXISTS artists CASCADE;

create table artists (
  id SERIAL PRIMARY KEY,
  name TEXT,
  photo_url TEXT,
  nationality TEXT
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  album TEXT NOT NULL,
  preview_url TEXT,
  artist_id INTEGER REFERENCES artists(id) ON DELETE CASCADE NOT NULL
);
```

```bash
psql -d tunr_sinatra < db/schema.sql
```

### Step 3 - Create the Model Classes

3a. Create the files

```bash
mkdir models
touch models/artist.rb
touch models/song.rb
```

3b. Set the contents of `models/artist.rb` to the following:

```ruby
class Artist < ActiveRecord::Base
  has_many :songs, dependent: :destroy
end
```

3c. Set the contents of `models/song.rb` to the following:

```ruby
class Song < ActiveRecord::Base
  belongs_to :artist
end
```

### Step 4 - Seed the Database using the Model Classes

4a. Create the `db/seeds.rb` file:

```bash
touch db/seeds.rb
```

4b. Set the contents of `db/seeds.rb` to the following:

```ruby
require 'active_record'
require_relative 'connection'

# models
require_relative '../models/artist'
require_relative '../models/song'

puts 'Seeding database with lots of groovy songs...'

Song.destroy_all
Artist.destroy_all

prince = Artist.create({
  name: 'Prince',
  photo_url: 'http://www.bet.com/content/betcom/music/photos/2012/06/the-evolution-of-prince/_jcr_content/image.custom1200x675x20.dimg/060712-music-evolution-Prince.jpg',
  nationality: 'American'
})

prince.songs.create([
  {
    title: 'Little Red Corvette',
    album: 'The Very Best of Prince',
    preview_url: 'http://a1099.phobos.apple.com/us/r1000/155/Music3/v4/e7/08/ff/e708ffdf-7820-171f-fe68-d2a46cf19af5/mzaf_2694294303456609176.plus.aac.p.m4a'
  },
  {
    title: 'When Doves Cry',
    album: 'Purple Rain (Soundtrack from the Motion Picture)',
    preview_url: 'http://a1861.phobos.apple.com/us/r1000/116/Music/85/20/c9/mzm.riqqlyip.aac.p.m4a'
  },
  {
    title: 'I Would Die 4 U',
    album: 'The Very Best of Prince',
    preview_url: 'http://a347.phobos.apple.com/us/r1000/070/Music/f5/89/09/mzm.lodcfhfb.aac.p.m4a'
  }
])

taylor_swift = Artist.create({
  name: 'Taylor Swift',
  photo_url: 'http://cdn.playbuzz.com/cdn/20a56b83-dcc7-4b01-833a-7c612c0bd96b/22fe4638-d675-47f8-9726-5f43e27bb084.jpg',
  nationality: 'American'
})

taylor_swift.songs.create([
  {
    title: 'Shake It Off',
    album: '1989',
    preview_url: 'http://a1780.phobos.apple.com/us/r1000/039/Music3/v4/b8/b3/7a/b8b37a93-2154-34da-74fc-8e8a316979a8/mzaf_7991652075174454658.plus.aac.p.m4a'
  },
  {
    title: 'Blank Space',
    album: '1989',
    preview_url: 'http://a1007.phobos.apple.com/us/r1000/145/Music3/v4/11/cf/71/11cf71d7-5a2b-660c-eef2-a8dacd9694cb/mzaf_9148830979689986253.plus.aac.p.m4a'
  },
  {
    title: 'Love Story',
    album: 'Fearless',
    preview_url: 'http://a1381.phobos.apple.com/us/r1000/116/Music/8d/7f/d5/mzm.yppdvtoz.aac.p.m4a'
  },
  {
    title: 'I Knew You Were Trouble',
    album: 'Red',
    preview_url: 'http://a1689.phobos.apple.com/us/r1000/120/Music/v4/b3/b1/01/b3b101c5-0afd-a536-394d-962b7012e8e1/mzaf_2968645385761922805.aac.m4a'
  }
])

kiss = Artist.create({
  name: 'Kiss',
  photo_url: 'http://www.gannett-cdn.com/-mm-/b0ad212381eab60e31d1f067f1c478cea741469a/c=0-10-3443-1963&r=x1683&c=3200x1680/local/-/media/USATODAY/GenericImages/2014/03/31//1396298223000-KISS-KISS-BAND-JY-0718-62187918.jpg',
  nationality: 'American'
})

kiss.songs.create([
  {
    title: 'Beth',
    album: 'Destroyer (Resurrected)',
    preview_url: 'http://a1586.phobos.apple.com/us/r1000/033/Music6/v4/7c/02/02/7c0202cc-7e77-0d33-d712-cb07b7cb66c6/mzaf_1239243828034249168.plus.aac.p.m4a'
  },
  {
    title: 'Detroit Rock City',
    album: '20th Century Masters - The Millennium Collection: The Best of Kiss',
    preview_url: 'http://a287.phobos.apple.com/us/r1000/132/Music4/v4/a4/c3/6f/a4c36f14-54b0-23e2-2e8b-d9288ccfbd7a/mzaf_8502549801881158998.plus.aac.p.m4a'
  },
  {
    title: 'Rock and Roll All Nite',
    album: 'Dressed to Kill',
    preview_url: 'http://a1263.phobos.apple.com/us/r1000/024/Music2/v4/4b/c1/90/4bc19072-f988-711e-48e6-1f5b30eb3015/mzaf_1024396724032502171.plus.aac.p.m4a'
  }
])

puts 'Seeding has completed!'
```

4c. Create the DB Connection configuration

```bash
touch db/connection.rb
```

4d. Set the contents of `db/connection.rb` to the following:

```ruby
# Load Active Record and connect to the DB
ActiveRecord::Base.establish_connection({
  database: 'tunr_sinatra',
  adapter: 'postgresql'
})

# Fix an issue with sinatra and Active Record where connections are left open
if defined? Sinatra
	after do
	  ActiveRecord::Base.connection.close
	end
end
```

4e. Run the seeds file:

```ruby
ruby db/seeds.rb
```

### Step 5 - Create the Controllers

5a. Create the files

```bash
mkdir controllers
touch controllers/artists.rb
touch controllers/songs.rb
```

5b. Set the contents of `controllers/artists.rb` to the following:

```ruby
# index
get "/artists" do
  @artists = Artist.all
  erb(:"artists/index")
end

# new
get "/artists/new" do
  erb(:"artists/new")
end

# create
post "/artists" do
  @artist = Artist.create!(params[:artist])
  redirect("/artists/#{@artist.id}")
end

#show
get "/artists/:id" do
  @artist = Artist.find(params[:id])
  erb(:"artists/show")
end

# edit
get "/artists/:id/edit" do
  @artist = Artist.find(params[:id])
  erb(:"artists/edit")
end

# update
put "/artists/:id" do
  @artist = Artist.find(params[:id])
  @artist.update(params[:artist])
  redirect("/artists/#{@artist.id}")
end

# destroy
delete "/artists/:id" do
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect to("/artists")
end
```

5c. Set the contents of `controllers/songs.rb` to the following:

```ruby
# index
get "/songs" do
  @songs = Song.all
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
```

### Step 6 - Create the Main App File

6a. Create the file:

```bash
touch app.rb
```

6b. Set the contents of `app.rb` to the following:

```ruby
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load specific routes / controllers
require_relative 'controllers/artists.rb'
require_relative 'controllers/songs.rb'

# Load models
require_relative 'models/artist'
require_relative 'models/song'

####################
#  General routes  #
####################

get "/" do
  erb :home
end
```

### Step 7 - Create the Layout and Home View

7a. Create the files

```bash
mkdir views
touch layout.erb
touch home.erb
```

7b. Add the following content to `views/layout.erb`:

```ruby
<html>
  <head>
    <title>Tun.r</title>
    <link rel="stylesheet" href="/style.css">
  </head>
  <body>
    <h1>Tun.r</h1>
    <nav>
      <a href="/songs">Songs</a>
      <a href="/artists">Artists</a>
    </nav>
    <%= yield %>
  </body>
</html>
```

7c. Add the following content to `views/home.erb`:

```ruby
<h2>Home</h2>

Tunr is the worlds #1 music web app.
```

### Step 8 - Create the Artist Views

8a. Create the files:

```bash
mkdir views/artists
touch views/artists/index.erb
touch views/artists/show.erb
touch views/artists/new.erb
touch views/artists/edit.erb
```

8b. Add the following content to `views/artists/index.erb`:

```ruby
<h2>Artists <a href="/artists/new">(+)</a></h2>

<ul>
  <% @artists.each do |artist| %>
    <li>
      <a href="/artists/<%= artist.id %>">
        <%= artist.name %>
      </a>
    </li>
  <% end %>
</ul>
```

8c. Add the following content to `views/artists/show.erb`:

```ruby
<h2><%= @artist.name %> <a href="/artists/<%= @artist.id %>/edit">(edit)</a></h2>
<h4><%= @artist.nationality %></h4>

<img class='artist-photo' src="<%= @artist.photo_url %>">

<h3>Songs</h3>
<ul>
  <% @artist.songs.each do |song| %>
    <!-- build the list element for each song -->
    <li>
      <a href="/songs/<%= song.id %>">
        <%= song.title %> (<%= song.album %>)
      </a>
    </li>

  <% end %>
</ul>
```

8d. Add the following content to `views/artists/new.erb`:

```ruby
<h2>New Artist</h2>

<form action="/artists" method="post" >
  <label for="artist[name]">Name:</label>
  <input name="artist[name]">

  <label for="artist[photo_url]">Photo URL:</label>
  <input name="artist[photo_url]">

  <label for="artist[nationality]">Nationality:</label>
  <input name="artist[nationality]">

  <input type="submit" value="Create">
</form>
```

8e. Add the following content to `views/artists/edit.erb`:

```ruby
<h2>Edit Artist</h2>

<form action="/artists/<%= @artist.id %>" method="post">
  <input type="hidden" name="_method" value="put">

  <label for="artist[name]">Name:</label>
  <input name="artist[name]" value="<%= @artist.name %>">

  <label for="artist[photo_url]">Photo URL:</label>
  <input name="artist[photo_url]" value="<%= @artist.photo_url %>">

  <label for="artist[nationality]">Nationality:</label>
  <input name="artist[nationality]" value="<%= @artist.nationality %>">

  <input type="submit" value="Create">
</form>

<form action="/artists/<%= @artist.id %>" method="post">
  <input type="hidden" name="_method" value="delete">
  <input class="button-delete" type="submit" value="Delete!">
</form>
```

### Step 9 - Create the Song Views

9a. Create the files:

```bash
mkdir views/songs
touch views/songs/index.erb
touch views/songs/show.erb
touch views/songs/new.erb
touch views/songs/edit.erb
```

9b. Add the following content to `views/songs/index.erb`:

```ruby
<h2>Songs <a href="/songs/new">(+)</a></h2>

<ul>
  <% @songs.each do |song| %>
    <li>
      <a href="/songs/<%= song.id %>">
        <%= song.title %> - <%= song.artist.name %>
      </a>
    </li>
  <% end %>
</ul>
```

9c. Add the following content to `views/songs/show.erb`:

```ruby
<h2><%= @song.title %> <a href="/songs/<%= @song.id %>/edit">(edit)</a></h2>
<h3>By: <%= @song.artist.name %></h3>

Album: <%= @song.album %></br>

<audio controls src="<%= @song.preview_url %>"></audio>
```

9d. Add the following content to `views/songs/new.erb`:

```ruby
<h2>New Song</h2>

<form action="/songs" method="post">
  <label for="song[title]">Title:</label>
  <input name="song[title]">

  <label for="song[album]">Album:</label>
  <input name="song[album]">

  <label for="song[preview_url]">Preview URL:</label>
  <input name="song[preview_url]">

  <label for="song[artist_id]">Artist ID:</label>
  <input name="song[artist_id]">

  <input type="submit" value="Create">
</form>
```

9e. Add the following content to `views/songs/edit.erb`:

```ruby
<h2>Edit Song</h2>

<form action="/songs/<%= @song.id %>" method="post">
  <input type="hidden" name="_method" value="put">

  <label for="song[title]">Title:</label>
  <input name="song[title]" value="<%= @song.title %>">

  <label for="song[album]">Album:</label>
  <input name="song[album]" value="<%= @song.album %>">

  <label for="song[preview_url]">Preview URL:</label>
  <input name="song[preview_url]" value="<%= @song.preview_url %>">

  <label for="song[artist_id]">Artist ID:</label>
  <input name="song[artist_id]" value="<%= @song.artist_id %>">

  <input type="submit" value="Create">
</form>

<form action="/songs/<%= @song.id %>" method="post">
  <input type="hidden" name="_method" value="delete">
  <input class="button-delete" type="submit" value="Delete!">
</form>
```

### Step 10 - Add the CSS

10a. Create the file:

```bash
mkdir public
touch public/style.css
```

10b. Add the following content to `public/style.css`:

```css
body{
  font-family:'Helvetica Neue', sans-serif;
  max-width: 50em;
  margin:auto;
  padding:2em 1em;
}

nav a {
  border: 1px solid black;
  margin: .5em;
  padding: .5em;
  background-color: #eeeeee;
}

nav a:hover {
  background-color: orange;
  color: blue;
}

a, a:visited {
  text-decoration: none;
  color: blue;
}

a:hover {
  background-color: #ccc;
}

ul {
  list-style-type: none;
}

li {
  margin: .25em;
}

h1 {
  font-inherit;
  color:inherit;
  letter-spacing:-.05em;
  text-decoration:none;
  border-bottom:1px solid black;
}

h2 > a {
  font-size: .75em;
}

input {
  display: block;
  margin: 5px 0 20px 0;
  padding: 9px;
  border: solid 1px black;
  width: 300px;
  background: whitesmoke;
}

input[type=submit] {
  width: auto;
  padding: 9px 15px;
  background-color: gray;
  border: 0;
  font-size: 14px;
  color: #FFFFFF;
}

input.button-delete {
  background-color: red;
}

.artist-photo {
  width: 400px;
}

span.nationality {
  font-size: .5em;
}
```

### Step 11 - Create a Gemfile and run Bundler

11a. Create the Gemfile

```bash
touch Gemfile
```

11b. Add the following content to `Gemfile`:

```ruby
source 'https://rubygems.org'

gem 'pry'

gem 'sinatra'
gem 'sinatra-contrib'

gem 'activerecord'
gem 'pg'
```

11c. Run Bundler

```bash
bundle install
```

### Step 12 - Test it out

```bash
ruby app.rb
```

## Bonuses

For some bonuses check out [bonuses](bonuses.md)
