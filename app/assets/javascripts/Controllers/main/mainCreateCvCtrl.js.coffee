@CreateCvCtrl = ($scope, $location, cvData) ->

  $scope.data = cvData.data
  cvData.loadCvs(null)

  $scope.formData =
    newCvNaslov: ''
    newCvDodatno: ''

  $scope.navNewCv = ->
    $location.url('/cv/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createCv = ->
    cvData.createCv($scope.formData)

  $scope.clearCv = ->
    $scope.formData.newCvNaslov = ''
    $scope.formData.newCvDodatno = ''


@CreateCvCtrl.$inject = ['$scope', '$location', 'cvData']