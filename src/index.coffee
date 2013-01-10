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

  for s in [ 'execute']
    Script = new require("./#{s}")
    new Script().init(robot)

