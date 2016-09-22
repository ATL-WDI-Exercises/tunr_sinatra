# Bonuses

## Bonus #1 - Select Input Control

* Use a select box of artist names instead of the artist_id when adding/editing songs. This enhancement will *not* change how the data is stored in the database, but will only change how the `new` and `edit` forms work.

## Bonus #2 - Playlists

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
