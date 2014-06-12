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
    newCvVjestine:''


  $scope.navNewCv = ->
    $location.url('/cv/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createCv = ->
    cvData.createCv($scope.formData)



@CreateCvCtrl.$inject = ['$scope', '$location', 'cvData', '$translate']