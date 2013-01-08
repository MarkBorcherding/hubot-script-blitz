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
#   hubot blitz me http://example.com - Run a sprint on the URL
#
# Author:
#   markborcherding
module.exports = (robot) ->

  Blitz = require 'blitz'
  EMAIL = process.env.HUBOT_BLITZ_EMAIL
  API_KEY = process.env.HUBOT_BLITZ_API_KEY

  robot.respond /blitz(?: me)? (.*)/i, (msg) ->
    url = msg.match[1]
    new Blitz(EMAIL, API_KEY).sprint
      steps: [
        url: url
      ]
    .on 'complete', (data) ->
      step = data.steps[0]
      msg.send """
      from: #{data.region}
      duration: #{step.duration}
      status: #{step.response.status}
      connect: #{step.connect}
      """
    .on 'error', (response) ->
      msg.send "I'm sorry Dave. I cannot do that. #{response.error} #{response.reason}"

