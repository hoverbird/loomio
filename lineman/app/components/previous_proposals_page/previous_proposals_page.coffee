angular.module('loomioApp').controller 'PreviousProposalsPageController', ($rootScope, $routeParams, Records) ->
  $rootScope.$broadcast('currentComponent', { page: 'previousProposalsPage'})

  Records.groups.findOrFetchById($routeParams.key).then (group) =>
    @group = group
    Records.proposals.fetchClosedByGroup(@group.key)


  return
