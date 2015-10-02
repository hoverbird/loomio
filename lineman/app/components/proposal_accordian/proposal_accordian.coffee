angular.module('loomioApp').directive 'proposalAccordian', ->
  scope: {proposals: '='}
  restrict: 'E'
  templateUrl: 'generated/components/proposal_accordian/proposal_accordian.html'
  replace: true
  controller: ($scope, CurrentUser) ->

    $scope.selectedProposalId = 0

    $scope.$on 'collapseProposal', (event) ->
      $scope.selectedProposalId = 0

    $scope.selectProposal = (proposal) =>
      $scope.selectedProposalId = proposal.id