module.export = (msg, response) ->
  error = response.error
  reason = response.reason
  msg.send "I'm sorry Dave. I cannot do that. #{error} #{reason}"

