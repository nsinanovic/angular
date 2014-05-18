@CreateAdvartismentCtrl = ($scope, $location, advartismentData) ->

  $scope.data = advartismentData.data
  advartismentData.loadAdvartisments(null)

  $scope.formData =
    newAdvartismentTitle: ''
    newAdvartismentDescription: ''

  $scope.navNewAdvartisment = ->
    $location.url('/advartisment/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createAdvartisment = ->
    advartismentData.createAdvartisment($scope.formData)

  $scope.clearAdvartisment = ->
    $scope.formData.newAdvartismentTitle = ''
    $scope.formData.newAdvartismentDescription = ''


@CreateAdvartismentCtrl.$inject = ['$scope', '$location', 'advartismentData']