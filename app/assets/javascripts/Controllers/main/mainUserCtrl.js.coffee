@UserCtrl = ($scope, $routeParams, $location, $q, userData, cvData, $translate) ->
  $translate.use('ba')

  $scope.changeLanguage  = (key) ->
    $translate.use(key)


  $scope.data1 = cvData.data
  cvData.loadCvs(null)

  $scope.data =
    userData: userData.data
    currentUser:
      email: 'Loading...'
      password: ''
      name: ''
      lastname: ''
      phone: ''
      address: ''
      username: ''

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
    $scope.data.currentUser.lastname = user.lastname
    $scope.data.currentUser.phone = user.phone
    $scope.data.currentUser.address = user.address
    $scope.data.currentUser.username = user.username
    $scope.data.currentUser.name = user.name

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepUserData)

  # Provide deferred promise chain to the loadPosts function
  userData.loadUsers(@deferred)


@UserCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'userData', 'cvData','$translate']