@EditCvCtrl = ($scope, $routeParams, $location, cvData) ->

  $scope.data = cvData.data
  $scope.data.cvId = $routeParams.cvId
  cv = _.findWhere(cvData.data.cvs, { id: parseInt($scope.data.cvId) })
  cvData.loadCvs(null)

  $scope.formData =
    editNaslov: cv.naslov
    editDodatno: cv.dodatno
    editId: cv.cvId

  $scope.navNewCv = ->
    $location.url('/cv/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.updateCv = ->
    cvData.editCv($scope.formData)


  $scope.clearCv = ->
    $scope.formData.editDodatno = ''
    $scope.formData.editNaslov = ''


@EditCvCtrl.$inject = ['$scope', '$routeParams','$location', 'cvData']