@EditUserCtrl = ($scope, $routeParams, $location, $q, userData) ->

  $scope.data =
    userData: userData.data
    currentUser:
      email: 'Loading...'
      password: ''

  $scope.formData =
    newUserEmail: ''
    newUserPassword: ''

  $scope.data.userId = $routeParams.userId

  $scope.navHome = ->
    $location.url('/')


  $scope.navEditUser =  ->
    $location.url('/user/'+ data.currentUser.id +'/edit')
  # This will be run once the loadPosts successfully completes (or immediately
  # if data is already loaded)
  $scope.prepUserData = ->
    user = _.findWhere(userData.data.users, { id: parseInt($scope.data.userId) })
    $scope.data.currentUser.email = user.email
    $scope.data.currentUser.password = user.password

  $scope.editUser = ->
    if $scope.formData.newUserEmail != '' and $scope.formData.newUserPassword != ''
      user = _.findWhere(userData.data.users, { id: parseInt($scope.data.userId) })
      user.email = $scope.formData.newUserEmail
      user.password = $scope.formData.newUserPassword

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepUserData)

  # Provide deferred promise chain to the loadPosts function
  userData.loadUsers(@deferred)


@EditUserCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'userData']