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
