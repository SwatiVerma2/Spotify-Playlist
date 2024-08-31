data "spotify_search_track" "karan"{
  artist = "Karan Aujla"
}

resource "spotify_playlist" "Jaskaran" {
  name = "Aujla-ni-Aujla"
  tracks = [data.spotify_search_track.karan.tracks[0].id,
  data.spotify_search_track.karan.tracks[1].id,
  data.spotify_search_track.karan.tracks[2].id,
  data.spotify_search_track.karan.tracks[3].id,
  data.spotify_search_track.karan.tracks[4].id,
  data.spotify_search_track.karan.tracks[5].id,
  data.spotify_search_track.karan.tracks[6].id
  ] 

}