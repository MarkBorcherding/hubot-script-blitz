
_ = require 'underscore'
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
    msg.send "Blitzing #{command}"
    new Blitz(EMAIL, API_KEY)
    .execute(command)
    .on('error', @on_error msg)
    .on('complete', @on_complete msg)

  on_complete: (msg) ->
    (data) =>
      if data.timeline

        durations = (step.duration for step in data.timeline)
        hits = (step.hits for step in data.timeline)
        errors = (step.errors for step in data.timeline)
        timeouts = (step.timeouts for step in data.timeline)

        msg.send """
        region: #{data.region}
        #{@spark_line 'duration', durations, @seconds}
        #{@spark_line 'hits', hits}
        #{@spark_line 'errors', errors}
        #{@spark_line 'timeouts', timeouts}
        """
      else
        msg.send """
        region: #{data.region}
        duration: #{data.duration}
        """

  spark_line: (label, array, display) ->
    unless display
      display = (s) -> s
    min = display _.min array
    max = display _.max array
    spark = require 'textspark'
    "#{label} (#{min}-#{max}): #{spark array}"

  seconds: (millisecond) ->
    millisecond = 0 if millisecond < 0
    "#{Math.round(millisecond * 1000)}ms"

module.exports = Execute
