angular.module('loomioApp').controller 'PreviousProposalsPageController', ($scope, $rootScope, $routeParams, Records) ->
  $rootScope.$broadcast('currentComponent', { page: 'previousProposalsPage'})

  Records.groups.findOrFetchById($routeParams.key).then (group) =>
    Records.proposals.fetchClosedByGroup(group.key).then =>
      @group = group

  @previousProposals = =>
    @group.closedProposals()

  return
