PORT = 3000

express = require 'express'
app = express()

app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.listen PORT, ->
  console.log "Listening on port #{PORT}"

app.get '/', (req, res) ->
  res.render 'home'
