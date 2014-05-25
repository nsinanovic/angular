@CreateKategorijaCtrl = ($scope, $location, kategorijaData) ->

  $scope.data = kategorijaData.data
  kategorijaData.loadKategorije(null)

  $scope.formData =
    newKategorijaTitle: ''



  $scope.navHome = ->
    $location.url('/')

  $scope.createKategorija = ->
    kategorijaData.createKategorija($scope.formData)




@CreateKategorijaCtrl.$inject = ['$scope', '$location', 'kategorijaData']