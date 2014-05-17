@CreateUserCtrl = ($scope, $location, userData) ->

  $scope.data = userData.data
  userData.loadUsers(null)

  $scope.formData =
    newUserEmail: ''
    newUserPassword: ''

  $scope.navNewUser = ->
    $location.url('/user/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createUser = ->
    userData.createUser($scope.formData)

  $scope.clearUser = ->
    $scope.formData.newUserEmail = ''
    $scope.formData.newUserPassword = ''


@CreateUserCtrl.$inject = ['$scope', '$location', 'userData']