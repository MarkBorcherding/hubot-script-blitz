#
#
# Description:
#   Expose blitz.io test via Hubot
#
# Dependencies:
#   "blitz": "0.4.1"
#
# Configuration:
#   HUBOT_BLITZ_EMAIL
#   HUBOT_BLITZ_API_KEY
#
# Commands:
#   hubot blitz me - Show the help
#
# Author:
#   markborcherding
module.exports = (robot) ->

  Blitz = require 'blitz-node'

  robot.respond /blitz me$/i, (msg) ->
    msg.send "Blitz help here."
