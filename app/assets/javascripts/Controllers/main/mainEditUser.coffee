@EditUserCtrl = ($scope, $routeParams, $location, userData) ->

  $scope.data = userData.data
  $scope.data.userId = $routeParams.userId
  user = _.findWhere(userData.data.users, { id: parseInt($scope.data.userId) })
  userData.loadUsers(null)


  $scope.formData =
    editUserName: user.name
    editUserLastname: user.lastname
    editUserPassword: user.password
    editUserAddress: user.address
    editUserPhone: user.phone
    editUserEmail: user.email
    editUserId: user.id

  $scope.navNewUser = ->
    $location.url('/user/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.updateUser = ->
    userData.editUser($scope.formData)
    $location.url('/')

  $scope.removeUser = ->
    userData.deleteUser($scope.formData)

  $scope.clearUser = ->
    $scope.formData.editUserName = ''
    $scope.formData.editUserLastname = ''
    $scope.formData.editUserAddress=''
    $scope.formData.editUserEmial = ''
    $scope.formData.editUserPhone = ''
    $scope.formData.editUserPassword = ''



@EditUserCtrl.$inject = ['$scope', '$routeParams','$location', 'userData']

