# Tunr 1.0!

Tunr is the worlds #1 music web app (those Spotify haters can't keep up with us).

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
