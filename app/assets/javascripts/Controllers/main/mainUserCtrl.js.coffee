@UserCtrl = ($scope, $routeParams, $location, $q, userData) ->

  $scope.data =
    userData: userData.data
    currentUser:
      email: 'Loading...'
      password: ''

  $scope.data.userId = $routeParams.userId

  $scope.navNewUser = ->
    $location.url('/user/new')

  $scope.navHome = ->
    $location.url('/')

  # This will be run once the loadPosts successfully completes (or immediately
  # if data is already loaded)
  $scope.prepUserData = ->
    user = _.findWhere(userData.data.users, { id: parseInt($scope.data.userId) })
    $scope.data.currentUser.email = user.email
    $scope.data.currentUser.password = user.password

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepUserData)

  # Provide deferred promise chain to the loadPosts function
  userData.loadUsers(@deferred)


@UserCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'userData']