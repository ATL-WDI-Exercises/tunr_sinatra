# Bonuses

## Bonus #1 - Select Input Control

Use a select box of artist names instead of the artist_id when adding/editing songs. This enhancement should *not* change how the data is stored in the database, but will only change how the `new` and `edit` forms work.

## Bonus #2 - Song Search

Add a Song Search feature to the Songs `index` page that alows a user to search for songs by title.

* You should use a form with a `text` input control, a `Search` button, and a 'Clear' button.
* The search form should send a `GET` request with the search data in the `URL`.
  - For example entering the text `red` would result in an HTTP GET request with the url `/songs?title=red`.
  - The search results should be case insensitive and should include partial matches (i.e. for the search text "red" the search results should include the song "Little Red Corvette").
  - Note that you are using the same Songs `index` page for both listing all songs and displaying Song search results. Thus if you search with the empty string the page should show all of the songs.
* If the user clicks the `Clear` button the song `index` page should reload with no search enabled and should display all of the songs.

## Bonus #3 - Playlists

Add support for Playlists to the Tunr app. A user should be able to:

* view a list of all playlists
* view a specific playlist (the songs on it)
* add a new playlist
* add songs to an existing playlist
* remove songs from an existing playlist
* delete a playlist


To support playlists you should create the following:

* The DB Tables
  - the `db/schema.sql` file will need to include the following:

```sql
CREATE TABLE playlists (
  id SERIAL PRIMARY KEY,
  name TEXT
);

-- The following table is a "MAPPING" table used to manage
-- a many-to-many relationship between playlists and songs.
-- Many-to-many relationships need an extra table to store
-- all of the foreign keys.
CREATE TABLE playlists_songs (
  song_id INTEGER REFERENCES songs(id) NOT NULL,
  playlist_id INTEGER REFERENCES playlists(id) NOT NULL
);
```

* a `Playlist` model class - `models/playlist.rb`
  - A `Playlist` should have a `name`
  - You will need to use a `has_and_belongs_to_many` relationship between the `Playlist` and `Song` model classes.
* a set of playlist routes - `controllers/playlists.rb`
* a set of playlist views:
  - `views/playlists/index.erb`
  - `views/playlists/show.erb`
  - `views/playlists/new.erb`
  - `views/playlists/edit.erb`
