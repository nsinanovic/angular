@CreateEmployerCtrl = ($scope, $location, employerData, $translate) ->
 $scope.changeLanguage  = (key) ->
  $translate.use(key)
  $scope.data = employerData.data
  employerData.loadEmployers(null)

  $scope.formData =
    newEmployerEmail: ''
    newEmployerPassword: ''
    newEmoployerName:''
    newEmployerLocation:''
    newEmployerWebsite:''


  $scope.navNewEmployer = ->
    $location.url('/employer/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createEmployer = ->
    employerData.createEmployer($scope.formData)
    $location.url('/')

  $scope.clearEmployer = ->
    $scope.formData.newEmployerEmail = ''
    $scope.formData.newEmployerPassword = ''
    $scope.formData.newEmployerLocation = ''
    $scope.formData.newEmployerWebsite= ''
    $scope.formData.newEmployerName = ''



@CreateEmployerCtrl.$inject = ['$scope', '$location', 'employerData', '$translate']