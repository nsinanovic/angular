@CreateUserCtrl = ($scope, $location, userData, $translate) ->
  $translate.use('ba')
  $scope.changeLanguage  = (key) ->
   $translate.use(key)

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
    newUserProvjera: ''

  $scope.navNewUser = ->
    $location.url('/user/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createUser = ->
    userData.createUser($scope.formData,$location)


  $scope.clearUser = ->
    $scope.formData.newUserEmail = ''
    $scope.formData.newUserPassword = ''
    $scope.formData.newUserAddress = ''
    $scope.formData.newUserPhone= ''
    $scope.formData.newUserName = ''
    $scope.formData.newUserLastname = ''
    $scope.formData.newUserUsername = ''


@CreateUserCtrl.$inject = ['$scope', '$location', 'userData', '$translate']