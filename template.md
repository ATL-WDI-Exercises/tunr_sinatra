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

2b. Set the contents of `db/schema.sql` to the following:

```sql
{{ db/schema.sql }}
```

```bash
psql -d tunr_sinatra < db/schema.sql
```

## Step 3 - Create the Model Classes

3a. Create the files

```bash
mkdir models
touch models/artist.rb
touch models/song.rb
```

3b. Set the contents of `models/artist.rb` to the following:

```ruby
{{models/artist.rb}}
```

3c. Set the contents of `models/song.rb` to the following:

```ruby
{{models/song.rb}}
```

## Step 4 - Seed the Database using the Model Classes

4a. Create the `db/seeds.rb` file:

```bash
touch db/seeds.rb
```

4b. Set the contents of `db/seeds.rb` to the following:

```ruby
{{ db/seeds.rb }}
```

4c. Create the DB Connection configuration

```bash
touch db/connection.rb
```

4d. Set the contents of `db/connection.rb` to the following:

```ruby
{{ db/connection.rb }}
```

4e. Run the seeds file:

```ruby
ruby db/seeds.rb
```

## Step 5 - Create the Controllers

5a. Create the files

```bash
mkdir controllers
touch controllers/artists.rb
touch controllers/songs.rb
```

5b. Set the contents of `controllers/artists.rb` to the following:

```ruby
{{ controllers/artists.rb }}
```

5c. Set the contents of `controllers/songs.rb` to the following:

```ruby
{{ controllers/songs.rb }}
```

## Step 6 - Create the Main App File

6a. Create the file:

```bash
touch app.rb
```

6b. Set the contents of `app.rb` to the following:

```ruby
{{ app.rb }}
```

## Step 7 - Create the Layout and Home View

7a. Create the files

```bash
mkdir views
touch layout.erb
touch home.erb
```

7b. Add the following content to `views/layout.erb`:

```ruby
{{ views/layout.erb }}
```

7c. Add the following content to `views/home.erb`:

```ruby
{{ views/home.erb }}
```

## Step 8 - Create the Artist Views

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
{{ views/artists/index.erb }}
```

8c. Add the following content to `views/artists/show.erb`:

```ruby
{{ views/artists/show.erb }}
```

8d. Add the following content to `views/artists/new.erb`:

```ruby
{{ views/artists/new.erb }}
```

8e. Add the following content to `views/artists/edit.erb`:

```ruby
{{ views/artists/edit.erb }}
```

## Step 9 - Create the Song Views

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
{{ views/songs/index.erb }}
```

9c. Add the following content to `views/songs/show.erb`:

```ruby
{{ views/songs/show.erb }}
```

9d. Add the following content to `views/songs/new.erb`:

```ruby
{{ views/songs/new.erb }}
```

9e. Add the following content to `views/songs/edit.erb`:

```ruby
{{ views/songs/edit.erb }}
```

## Step 10 - Add the CSS

10a. Create the file:

```bash
mkdir public
touch public/style.css
```

10b. Add the following content to `public/style.css`:

```css
{{ public/style.css }}
```

## Step 11 - Create a Gemfile and run Bundler

11a. Create the Gemfile

```bash
touch Gemfile
```

11b. Add the following content to `Gemfile`:

```ruby
{{ Gemfile }}
```

11c. Run Bundler

```bash
bundle install
```

## Step 12 - Test it out

```bash
ruby app.rb
```
