@AdvartismentCtrl = ($scope, $routeParams, $location, $q, advartismentData) ->

  $scope.data =
    advartismentData: advartismentData.data
    currentAdvartisment:
      title: 'Loading...'
      description: ''

  $scope.data.advartismentId = $routeParams.advartismentId

  $scope.navNewAdvartisment = ->
    $location.url('/advartisment/new')

  $scope.navHome = ->
    $location.url('/')

  # This will be run once the loadPosts successfully completes (or immediately
  # if data is already loaded)
  $scope.prepAdvartismentData = ->
    advartisment = _.findWhere(advartismentData.data.advartisments, { id: parseInt($scope.data.advartismentId) })
    $scope.data.currentAdvartisment.title = advartisment.title
    $scope.data.currentAdvartisment.description = advartisment.description

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepAdvartismentData)

# Provide deferred promise chain to the loadPosts function
advartismentData.loadAdvartisments(@deferred)


@AdvartismentCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'advartismentData']