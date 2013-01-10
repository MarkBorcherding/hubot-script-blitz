
Blitz = require 'blitz'
Script = require './script'

EMAIL = process.env.HUBOT_BLITZ_EMAIL
API_KEY = process.env.HUBOT_BLITZ_API_KEY

class Execute extends Script

  constructor: ()->
    super()
    @regex = /blitz me (.+)/i

  init: (robot) ->
    robot.respond @regex, @run if robot

  run: (msg) =>
    command = msg.match[1]
    new Blitz(EMAIL, API_KEY)
    .execute(command)
    .on('error', @on_error msg)
    .on('complete', @on_complete msg)

  on_complete: (msg) ->
    (data) ->
      spark = require 'textspark'
      if data.timeline
        durations = (step.duration for step in data.timeline)
        hits = (step.hits for step in data.timeline)
        msg.send """
        region: #{data.region}
        duration: #{spark durations}
        hits: #{spark hits}
        """
      else
        msg.send """
        region: #{data.region}
        duration: #{data.duration}
        """


module.exports = Execute
