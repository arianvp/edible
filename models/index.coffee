mongoskin = require 'mongoskin'
db = mongoskin.db 'localhost/edible'

exports.blog.posts = db.collection 'blog.posts'
exports.users = db.collection 'users'

