require 'active_record'
require_relative 'connection'

# models
require_relative '../models/artist'
require_relative '../models/song'
require_relative '../models/playlist'

puts 'Seeding database with lots of groovy songs...'
Playlist.destroy_all
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

playlist_names = %w(TunrDownForWhat? WorkoutJamz ScreenMusic)

playlist_names.each do |playlist_name|
  new_playlist = Playlist.create!({
    name: playlist_name
  })
  new_playlist.songs << Song.all.sample(3 + rand(7))
  puts "new_pLaylist: #{new_playlist}"
end

puts 'Seeding has completed!'
