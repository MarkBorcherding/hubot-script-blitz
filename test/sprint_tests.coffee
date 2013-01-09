assert = require "should"

describe "Sprint", ()->

  Sprint = require "../src/sprint"

  describe "regex", () ->
    regex = Sprint.regex

    describe 'simple command', ()->
      message = "blitz me http://foo.com"

      it 'should match 2 results', ()->
        regex.exec(message).length.should.equal 2


  describe "response formatting", ()->
    format = Sprint.format

    data =
      region: 'springfield'
      steps: [
        duration: 0.1, connect: 0.2, response:
                                       status: 200
      ]

    it 'should format', ()->
      format(data).should.equal """
        from: springfield
        duration: 0.1
        status: 200
        connect: 0.2
        """
