@CvCtrl = ($scope, $routeParams, $location, $q, cvData) ->

  $scope.data =
    cvData: cvData.data
    currentCv:
      naslov: 'Loading...'
      dodatno: ''

  $scope.data.cvId = $routeParams.cvId

  $scope.navNewCv = ->
    $location.url('/cv/new')

  $scope.navHome = ->
    $location.url('/')

  # This will be run once the loadPosts successfully completes (or immediately
  # if data is already loaded)
  $scope.prepCvData = ->
    cv = _.findWhere(cvData.data.cvs, { id: parseInt($scope.data.cvId) })
    $scope.data.currentCv.naslov = cv.naslov
    $scope.data.currentCv.dodatno=cv.dodatno

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepCvData)

  # Provide deferred promise chain to the loadPosts function
  cvData.loadCvs(@deferred)


@CvCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'cvData']