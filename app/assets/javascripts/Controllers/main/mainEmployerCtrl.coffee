@EmployerCtrl = ($scope, $routeParams, $location, $q, employerData, $translate) ->
 $scope.changeLanguage  = (key) ->
  $translate.use(key)
  $scope.data =
    employerData: employerData.data
    currentEmployer:
      email: 'Loading...'
      password: ''
      name: ''
      location: ''
      website: ''

  $scope.data.employerId = $routeParams.employerId

  $scope.navNewEmployer = ->
    $location.url('/employer/new')

  $scope.navHome = ->
    $location.url('/')

  # This will be run once the loadPosts successfully completes (or immediately
  # if data is already loaded)
  $scope.prepEmployerData = ->
    employer = _.findWhere(employerData.data.employers, { id: parseInt($scope.data.employerId) })
    $scope.data.currentEmployer.email = employer.email
    $scope.data.currentEmployer.password = employer.password
    $scope.data.currentEmployer.name = employer.name
    $scope.data.currentEmployer.location = employer.location
    $scope.data.currentEmployer.website = employer.website

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepEmployerData)

  # Provide deferred promise chain to the loadPosts function
  employerData.loadEmployers(@deferred)


@EmployerCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'employerData', '$translate']