class Script
  constructor: ()->
    @regex = /you will never match this/

  on_error: (msg) ->
    (response) ->
      error = response.error
      reason = response.reason
      msg.send "I'm sorry Dave. I cannot do that. #{error} #{reason}"

module.exports = Script
