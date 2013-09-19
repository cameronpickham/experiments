$.getJSON "http://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=xAdInfinitum&api_key=2cabf97750ff23554d8c8a8140f7bcd6&format=json", (data) ->
  console.log data
