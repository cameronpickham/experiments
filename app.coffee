PORT = 4000

request = require 'request'
express = require 'express'
app = express()

app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.use express.bodyParser()
app.use express.methodOverride()
app.use express.logger("dev")
app.use app.router
app.use(express.static(__dirname+'/static'))

app.listen PORT, ->
  console.log "Listening on port #{PORT}"

app.get '/', (req, res) ->
  res.render 'index'

app.get '/music', (req, res) ->
  request 'http://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=xAdInfinitum&api_key=2cabf97750ff23554d8c8a8140f7bcd6&format=json', (err, response, body) ->
    data = JSON.parse body
    res.render 'music', data

app.get '/lol', (req, response) ->
  request "https://prod.api.pvp.net/api/lol/na/v1.1/game/by-summoner/329/recent?api_key=728655af-cfc6-4cd1-8610-32d4380b86bc", (err, res, body) ->
    body = JSON.parse body
    championIds = []
    for game in body.games
      championIds.push game.championId

    response.render 'lol', { ids: championIds }
