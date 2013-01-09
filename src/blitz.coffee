Blitz = require 'blitz'

EMAIL = process.env.HUBOT_BLITZ_EMAIL
API_KEY = process.env.HUBOT_BLITZ_API_KEY

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

  # as we add more commands we just need to expose an init method to
  # make it easier to test
  for script in [
    require 'sprint'
  ]
    script.init robot

