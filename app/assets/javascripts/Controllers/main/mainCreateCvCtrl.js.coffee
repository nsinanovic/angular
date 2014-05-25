@CreateCvCtrl = ($scope, $location, cvData) ->

  $scope.data = cvData.data
  cvData.loadCvs(null)

  $scope.formData =
    newCvNaslov: ''
    newCvDodatno: ''
    newCvObrazovanje: ''
    newCvRadno: ''
    newCvSprema: ''
    newCvJezici: ''
    newCvDodatno:''

  $scope.navNewCv = ->
    $location.url('/cv/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createCv = ->
    cvData.createCv($scope.formData)




@CreateCvCtrl.$inject = ['$scope', '$location', 'cvData']