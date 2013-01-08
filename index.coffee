#
#
# Description:
#   Expose blitz.io test via Hubot
#
# Commands:
#   hubot blitz me - Show the help
module.exports = (robot) ->

  Blitz = require 'blitz-node'

  robot.respond /blitz me$/i, (msg) ->
    msg.send "Blitz help here."
