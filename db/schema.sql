DROP TABLE IF EXISTS playlists_songs CASCADE;
DROP TABLE IF EXISTS songs           CASCADE;
DROP TABLE IF EXISTS playlists       CASCADE;
DROP TABLE IF EXISTS artists         CASCADE;

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

CREATE TABLE playlists (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE playlists_songs (
  song_id INTEGER REFERENCES songs(id) NOT NULL,
  playlist_id INTEGER REFERENCES playlists(id) NOT NULL
);
