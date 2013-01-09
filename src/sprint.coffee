
regex = /blitz(?: me)? sprint (.*)/i

format = (data) ->
  step = data.steps[0]
  """
  from: #{data.region}
  duration: #{step.duration}
  status: #{step.response.status}
  connect: #{step.connect}
  """
run = (msg) ->
  url = msg.match[1]
  new Blitz(EMAIL, API_KEY).sprint
    steps: [
      url: url
    ]
  .on 'complete', (data) ->
    msg.send format data
  .on 'error', (response) ->
    msg.send "I'm sorry Dave. I cannot do that. #{response.error} #{response.reason}"

module.exports =
  regex: regex
  format: format
  run: run
  init: (robot) ->
    robot.respond regex, run

