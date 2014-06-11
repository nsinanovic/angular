@CreateCvCtrl = ($scope, $location, cvData, $translate) ->
 $scope.changeLanguage  = (key) ->
  $translate.use(key)
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

$scope.clearCv= ->
    $scope.formData.newCvNaslov == ''
    $scope.formData.newCvDodatno == ''
    $scope.formData.newCvObrazovanje == ''
    $scope.formData.newCvRadno == ''
    $scope.formData.newCvSprema == ''
    $scope.formData.newCvJezici == ''

@CreateCvCtrl.$inject = ['$scope', '$location', 'cvData', '$translate']