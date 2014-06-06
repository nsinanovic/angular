@IndexCtrl = ($scope, $location, $http, advartismentData) ->

  $scope.data = advartismentData.data
  advartismentData.loadAdvartisments(null)

  $scope.viewAdvartisment = (advartismentId) ->
    $location.url('/advartisment/'+advartismentId)

  $scope.navNewAdvartisment = ->
    $location.url('/advartisment/new')

@IndexCtrl.$inject = ['$scope', '$location', '$http', 'advartismentData']