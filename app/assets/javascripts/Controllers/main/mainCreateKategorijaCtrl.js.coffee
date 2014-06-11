@CreateKategorijaCtrl = ($scope, $location, kategorijaData, $translate) ->
 $scope.changeLanguage  = (key) ->
  $translate.use(key)
  $scope.data = kategorijaData.data
  kategorijaData.loadKategorijas(null)

  $scope.formData =
    newKategorijaTitle: ''


  $scope.navNewKategorija = ->
    $location.url('/kategorija/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createKategorija = ->
    kategorijaData.createKategorija($scope.formData)




@CreateKategorijaCtrl.$inject = ['$scope', '$location', 'kategorijaData', '$translate']