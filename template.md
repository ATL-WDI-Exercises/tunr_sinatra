# Instructions for Building This App

{{ TOC }}

## Step 1 - Create The Project Directory

```bash
cd ~/ga/wdi/exercises
mkdir tunr_sinatra
cd tunr_sinatra
```

## Step 2 - Create and Seed the Database

2a. Create the `tunr_sinatra` database:

```bash
dropdb tunr_sinatra
createdb tunr_sinatra
mkdir db
touch db/schema.sql
```

Set the contents of `db/schema.sql` to the following:

```sql
{{ db/schema.sql }}
```

```bash
psql -d tunr_sinatra < db/schema.sql
```

## Step 3 - Create the Model Classes

```bash
mkdir models
touch models/artist.rb
touch models/song.rb
```

Set the contents of `models/artist.rb` to the following:

```ruby
{{models/artist.rb}}
```

Set the contents of `models/songs.rb` to the following:

```ruby
{{models/song.rb}}
```

## Step 4 - Seed the Database using the Model Classes

4a. Create the `db/seeds.js` file:

```bash
touch db/seeds.js
```

Set the contents of `db/seeds.rb` to the following:

```ruby
{{ db/seeds.rb }}
```

4b. Run the seeds file:

```ruby
ruby db/seeds.rb
```

## Step 5 - Create the DB Connection configuration

```bash
touch db/connection.rb
```

Set the contents of `db/connection.rb` to the following:

```ruby
{{ db/connection.rb }}
```

## Step 6 - Create the Controllers

```bash
touch controllers/artists.rb
touch controllers/songs.rb
```

Set the contents of `controllers/artists.rb` to the following:

```ruby
{{ controllers/artists.rb }}
```

Set the contents of `controllers/songs.rb` to the following:

```ruby
{{ controllers/songs.rb }}
```

## Step 7 - Create the Main App File

```bash
touch app.rb
```

Set the contents of `app.rb` to the following:

```ruby
{{ app.rb }}
```

## Step 8 - Create the Layout and Views

```bash
mkdir views
touch layout.erb
touch home.erb

mkdir views/artists
touch views/artists/index.erb
touch views/artists/show.erb
touch views/artists/new.erb
touch views/artists/edit.erb

mkdir views/songs
touch views/songs/index.erb
touch views/songs/show.erb
touch views/songs/new.erb
touch views/songs/edit.erb
```

### views/layout.erb

```ruby
{{ views/layout.erb }}
```

### views/home.erb

```ruby
{{ views/home.erb }}
```

### views/artists/index.erb

```ruby
{{ views/artists/index.erb }}
```

### views/artists/show.erb

```ruby
{{ views/artists/show.erb }}
```

### views/artists/new.erb

```ruby
{{ views/artists/new.erb }}
```

### views/artists/edit.erb

```ruby
{{ views/artists/edit.erb }}
```

### views/songs/index.erb

```ruby
{{ views/songs/index.erb }}
```

### views/songs/show.erb

```ruby
{{ views/songs/show.erb }}
```

### views/songs/new.erb

```ruby
{{ views/songs/new.erb }}
```

### views/songs/edit.erb

```ruby
{{ views/songs/edit.erb }}
```

## Step 9 - Test it out

```bash
ruby app.rb
```
