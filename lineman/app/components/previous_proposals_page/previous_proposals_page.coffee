angular.module('loomioApp').controller 'PreviousProposalsPageController', ($scope, $rootScope, $routeParams, Records, AbilityService) ->
  $rootScope.$broadcast('currentComponent', { page: 'previousProposalsPage'})

  Records.groups.findOrFetchById($routeParams.key).then (group) =>
    @group = group
    if AbilityService.canViewPreviousProposals(@group)
      Records.proposals.fetchClosedByGroup($routeParams.key).then =>
        Records.votes.fetchMyVotesByProposals(@group.closedProposals())
    else
      $rootScope.$broadcast 'pageError', { status: 403 }, @group

  return
