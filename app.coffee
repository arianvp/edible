zappa = require 'zappa'
models = require './models'

postsModel = models.blog.posts
zappa ->
	@use 'static'

	@get '/': -> @render 'index'

	@get '/posts' : ->
		# We have to make sure we're dealing with numbers that are positive.
		defaultLimit = 2
		defaultOffset = 0
		limit = parseInt(@query.limit ? "#{defaultLimit}")
		offset = parseInt(@query.offset ? "#{defaultOffset}")
		if isNaN(limit) or isNaN(offset)
			limit = defaultLimit
			offset = defaultOffset
			
		limit = defaultLimit unless limit > 0
		offset = defaultOffset unless offset >= 0

	@get '/posts:id' : ->
		await postsModel.findById @params.id,
		defer err, post

		#TODO error handling

		await #in parallel

			# the creationDate is indexed as order:-1, hence sorting is :1	
			postsModel
				.find({creationDate: $lt: post.creationDate}, _id:1)
				.sort(creationDate:1)
				.limit(1)
				.toArray defer err, previousPosts

			postsModel
				.find({creationDate: $gt: post.creationDate}, _id:1)
				.sort(creationDate:1)
				.limit(1)
				.toArray defer err, nextPosts

			@render post: postsModel
				title: post.title
				previousPost: previousPosts[0]
				nextPost: nextPosts[0]
