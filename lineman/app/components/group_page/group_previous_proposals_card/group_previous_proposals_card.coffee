angular.module('loomioApp').directive 'groupPreviousProposalsCard', ->
  scope: {group: '='}
  restrict: 'E'
  templateUrl: 'generated/components/group_page/group_previous_proposals_card/group_previous_proposals_card.html'
  replace: true
  controller: ($scope, CurrentUser, Records, AbilityService) ->
    if AbilityService.canViewPreviousProposals($scope.group)
      Records.proposals.fetchClosedByGroup($scope.group.key).then ->
        Records.votes.fetchMyVotesByProposals($scope.group.closedProposals())

    $scope.showPreviousProposals = ->
      AbilityService.canViewPreviousProposals($scope.group)

    $scope.lastVoteByCurrentUser = (proposal) ->
      proposal.lastVoteByUser(CurrentUser)


