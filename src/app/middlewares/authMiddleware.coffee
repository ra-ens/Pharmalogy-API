###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

jwt 	= require 'jsonwebtoken'
config 	= require '../../config'
User 	= require '../models/user'

module.exports = (req, res, next) ->

	# get token from headers
	token = req.headers.token

	# check token
	jwt.verify token, config.jwt.secret, (err, decoded) ->
		if err
			# failed to validate token
			res.status(401).json
				message: "Access denied"
		else
			# check database for user
			user = await User.findByPk decoded.id
			unless user
				res.status(400).json
					message: "Unauthorized token"
			else
				# add user to request object
				req.user = user
				# call next handler
				do next
		return
	return
