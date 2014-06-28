@AdvartismentCtrl = ($scope, $routeParams, $location, $q, advartismentData, employerData, $translate) ->
  $translate.use('ba')

  $scope.changeLanguage  = (key) ->
    $translate.use(key)


  d=new Date()
  m= d.getMonth()+1
  y= d.getFullYear()
  $scope.datum = y+'-'+m+'-'+d.getDate()



  $scope.data =
    advartismentData: advartismentData.data
    currentAdvartisment:
      title: 'Loading...'
      description: ''
      location: ''
      category: ''
      employer: ''
      days: ''

  $scope.data.advartismentId = $routeParams.advartismentId


  $scope.data1 = advartismentData.data
  advartismentData.loadAdvartisments(null)

  $scope.data2 = employerData.data
  employerData.loadEmployers(null)

  $scope.navNewAdvartisment = ->
    $location.url('/advartisment/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.viewAdvartisment = (advartismentId) ->
    $location.url('/advartisment/'+advartismentId)

  # This will be run once the loadPosts successfully completes (or immediately
  # if data is already loaded)
  $scope.prepAdvartismentData = ->
    advartisment = _.findWhere(advartismentData.data.advartisments, { id: parseInt($scope.data.advartismentId) })
    $scope.data.currentAdvartisment.title = advartisment.title
    $scope.data.currentAdvartisment.description = advartisment.description
    $scope.data.currentAdvartisment.location = advartisment.location
    $scope.data.currentAdvartisment.category = advartisment.category
    $scope.data.currentAdvartisment.employer = advartisment.employer
    $scope.data.currentAdvartisment.expire = advartisment.expire
    $scope.data.currentAdvartisment.days = advartisment.published


  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepAdvartismentData)

  # Provide deferred promise chain to the loadPosts function
  advartismentData.loadAdvartisments(@deferred)


@AdvartismentCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'advartismentData', 'employerData','$translate']