@CreateCvCtrl = ($scope, $location, cvData, notificationData, kategorijaData, $translate) ->

  $translate.use('ba')

  $scope.changeLanguage  = (key) ->
    $translate.use(key)

  $scope.data = cvData.data
  cvData.loadCvs(null)

  $scope.data2 = notificationData.data
  notificationData.loadNotifications(null)

  $scope.data3 = kategorijaData.data
  kategorijaData.loadKategorijas(null)


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



@CreateCvCtrl.$inject = ['$scope', '$location', 'cvData', 'notificationData', 'kategorijaData', '$translate']