@CreateUserCtrl = ($scope, $location, userData) ->

  $scope.data = userData.data
  userData.loadUsers(null)

  $scope.formData =
    newUserEmail: ''
    newUserPassword: ''
    newUserName:''
    newUserLastname:''
    newUserAddress:''
    newUserPhone:''
    newUserUsername: ''

  $scope.navNewUser = ->
    $location.url('/user/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createUser = ->
    userData.createUser($scope.formData)

  $scope.clearUser = ->
    $scope.formData.newUserEmail = ''
    $scope.formData.newUserPassword = ''
    $scope.formData.newUserAddress = ''
    $scope.formData.newUserPhone= ''
    $scope.formData.newUserName = ''
    $scope.formData.newUserLastname = ''
    $scope.formData.newUserUsername = ''


@CreateUserCtrl.$inject = ['$scope', '$location', 'userData']