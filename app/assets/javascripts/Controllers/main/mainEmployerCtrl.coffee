@EmployerCtrl = ($scope, $routeParams, $location, $q, employerData, advartismentData, $translate) ->

  $translate.use('ba')

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
      created_t:''

  $scope.data.employerId = $routeParams.employerId

  $scope.data2 = advartismentData.data
  advartismentData.loadAdvartisments(null)

  $scope.brojac =0


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
    $scope.data.currentEmployer.created_at = employer.created_at
    $scope.data.currentEmployer.id=employer.id

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepEmployerData)

  # Provide deferred promise chain to the loadPosts function
  employerData.loadEmployers(@deferred)


@EmployerCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'employerData', 'advartismentData','$translate']