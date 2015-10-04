angular.module('loomioApp').controller 'PreviousProposalsPageController', ($scope, $rootScope, $routeParams, Records) ->
  $rootScope.$broadcast('currentComponent', { page: 'previousProposalsPage'})

  Records.groups.findOrFetchById($routeParams.key).then (group) =>
    @group = group
    Records.proposals.fetchClosedByGroup($routeParams.key).then =>
      Records.votes.fetchMyVotesByProposals(group.closedProposals())

  return
