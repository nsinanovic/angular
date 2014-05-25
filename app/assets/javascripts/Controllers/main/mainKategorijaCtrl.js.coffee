@KategorijaCtrl = ($scope, $routeParams, $location, $q, kategorijaData) ->

  $scope.data =
    kategorijaData: kategorijaData.data
    currentKategorija:
      title: ''


  $scope.data.kategorijaId = $routeParams.kategorijaId



  $scope.navHome = ->
    $location.url('/')

  # This will be run once the loadPosts successfully completes (or immediately
  # if data is already loaded)
  $scope.prepKategorijasData = ->
    kategorija = _.findWhere(kategorijaData.data.kategorijas, { id: parseInt($scope.data.kategorijaId) })

    $scope.data.currentKategorija.title = kategorija.title


  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepKategorijasData)

  # Provide deferred promise chain to the loadPosts function
  kategorijaData.loadKategorije(@deferred)


@KategorijaCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'kategorijaData']