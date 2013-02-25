express = require 'express'
http = require 'http'
path = require 'path'
app = do express

app.configure ->
  app.set 'port', process.env.PORT ? 3000
  app.use do express.favicon
  app.use express.logger 'dev'
  app.use do express.bodyParser
  app.use do express.methodOverride
  app.use app.router
  app.use express.static path.join __dirname, 'public'
  app.use express.static path.join __dirname, 'components'

app.configure 'development', ->
  app.use do express.errorHandler

http.createServer(app)
  .listen app.get('port'), () ->
      console.log("Express server listening on port #{app.get('port')}")