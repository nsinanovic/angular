@EditCvCtrl = ($scope, $routeParams, $location, cvData, $translate) ->
  $translate.use('ba')
  $scope.changeLanguage  = (key) ->
    $translate.use(key)
  $scope.data = cvData.data
  $scope.data.cvId = $routeParams.cvId
  cv = _.findWhere(cvData.data.cvs, { id: parseInt($scope.data.cvId) })
  cvData.loadCvs(null)


  $scope.formData =
    editCvNaslov: cv.naslov
    editCvDodatno: cv.dodatno
    editCvObrazovanje: cv.obrazovanje
    editCvVjestine: cv.vjestine
    editCvJezici: cv.jezici
    editCvStrucnaSprema: cv.strucnaSprema
    editCvRadnoIskustvo: cv.radnoIskustvo
    editCvId: cv.id

  $scope.navNewCv = ->
    $location.url('/cv/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.updateCv = ->
    cvData.editCv($scope.formData)
    $location.url('/')


@EditCvCtrl.$inject = ['$scope', '$routeParams','$location', 'cvData', '$translate']

