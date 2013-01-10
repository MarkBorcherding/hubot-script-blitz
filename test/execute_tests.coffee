should = require 'should'


describe 'Execute', ->

  Execute = require '../src/execute'
  execute = new Execute()

  describe 'regex', ->
    regex = execute.regex

    it 'should find the command', ->
      matches = regex.exec('blitz me some command')
      matches[1].should.equal 'some command'


