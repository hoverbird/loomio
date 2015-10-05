describe 'Previous proposals', ->

  groupsHelper = require './helpers/groups_helper.coffee'

  beforeEach ->
    groupsHelper.loadWithClosedProposal()

  describe 'previous proposals page', ->
    it 'displays proposal previews for each closed proposal', ->
      
