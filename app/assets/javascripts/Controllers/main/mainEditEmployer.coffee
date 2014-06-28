@EditEmployerCtrl = ($scope, $routeParams, $location, employerData, $translate) ->
  $translate.use('ba')

  $scope.data = employerData.data
  $scope.data.employerId = $routeParams.employerId
  employer = _.findWhere(employerData.data.employers, { id: parseInt($scope.data.employerId) })
  employerData.loadEmployers(null)


  $scope.formData =
    editEmployerName: employer.name
    editEmployerPassword: employer.password
    editEmployerLocation: employer.location
    editEmployerWebsite: employer.website
    editEmployerEmail: employer.email
    editEmployerId: employer.id
    editEmployerDate: employer.created_at

  $scope.navNewEmployer = ->
    $location.url('/employer/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.editEmployer = (employerId) ->
    $location.url('/employer/edit/'+employerId)

  $scope.updateEmployer = ->
    employerData.editEmployer($scope.formData)
    $location.url('/')

  $scope.removeEmployer = ->
    employerData.deleteEmployer($scope.formData)

  $scope.clearEmployer = ->
    $scope.formData.editEmployerName = ''
    $scope.formData.editEmployerLocatin=''
    $scope.formData.editEmployerEmial = ''
    $scope.formData.editEmployerWebsite = ''
    $scope.formData.editEmployerPassword = ''



@EditEmployerCtrl.$inject = ['$scope', '$routeParams','$location', 'employerData', '$translate']

