@CreateEmployerCtrl = ($scope, $location, employerData) ->

  $scope.data = employerData.data
  employerData.loadEmployers(null)

  $scope.formData =
    newUEmployerEmail: ''
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

  $scope.clearEmployer = ->
    $scope.formData.newEmployerEmail = ''
    $scope.formData.newEmployerPassword = ''
    $scope.formData.newEmployerLocationm = ''
    $scope.formData.newEmployerWebsite= ''
    $scope.formData.newEmployerName = ''



@CreateEmployerCtrl.$inject = ['$scope', '$location', 'employerData']