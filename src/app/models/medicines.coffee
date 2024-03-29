###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

{ DataTypes, Model } 	= require 'sequelize'
{ sequelize } 			= require '../../database'

###
	Medicine model
###

class Medicine extends Model

# initialize model
Medicine.init
	name:
		allowNull: false
		type: Sequelize.STRING
	labo:
		allowNull: false,
		type: Sequelize.STRING
	serialNumber:
		allowNull: false,
		type: Sequelize.INTEGER 20
	status:
		allowNull: false
		type: Sequelize.BOOLEAN
		defaultValue: 1
	createdAt:
		allowNull: false
		type: Sequelize.DATE
	updatedAt:
		allowNull: false
		type: Sequelize.DATE