zappa = require 'zappa'

zappa ->
	@use 'static'

	@get '/': -> @render 'index'
	@get '/posts' : ->
	@get '/posts:id' : ->
