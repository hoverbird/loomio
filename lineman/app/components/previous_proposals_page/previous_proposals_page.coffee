angular.module('loomioApp').controller 'PreviousProposalsPageController', ($scope, $rootScope, $routeParams, Records) ->
  $rootScope.$broadcast('currentComponent', { page: 'previousProposalsPage'})

  Records.groups.findOrFetchById($routeParams.key).then (group) =>
    Records.proposals.fetchClosedByGroup(group.key).then =>
      Records.votes.fetchMyVotesByProposals(group.closedProposals()).then =>
        $scope.group = group

  @previousProposals = =>
    $scope.group.closedProposals()

  return
