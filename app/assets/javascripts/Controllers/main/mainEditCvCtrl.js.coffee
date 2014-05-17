@EditCvCtrl = ($scope, $location, cvData) ->

  $scope.prepCvData = ->
    cv = _.findWhere(cvData.data.cvs, { id: parseInt($scope.data.cvId) })
    $scope.data.currentCv.naslov = cv.naslov
    $scope.data.currentCv.dodatno=cv.dodatno

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepCvData)

  # Provide deferred promise chain to the loadPosts function
  cvData.loadCvs(@deferred)

  $scope.navEditCv = ->
    $location.url('/cv/:cvId/edit')

  $scope.navHome = ->
    $location.url('/')

  $scope.editCv = ->
    cvData.editCv($scope.prepCvData)

@EditCvCtrl.$inject = ['$scope', '$location', 'cvData']

