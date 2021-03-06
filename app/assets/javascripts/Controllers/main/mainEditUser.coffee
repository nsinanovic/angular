@EditUserCtrl = ($scope, $routeParams, $location, userData, cvData, notificationData, kategorijaData, $translate) ->

  $translate.use('ba')
  $scope.changeLanguage  = (key) ->
    $translate.use(key)

  $scope.data1 = cvData.data
  cvData.loadCvs(null)

  $scope.data2 = notificationData.data
  notificationData.loadNotifications(null)

  $scope.data3 = kategorijaData.data
  kategorijaData.loadKategorijas(null)

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

  $scope.editUser = (userId) ->
    $location.url('/user/edit/'+userId)

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



@EditUserCtrl.$inject = ['$scope', '$routeParams','$location', 'userData','cvData', 'notificationData', 'kategorijaData', '$translate']

