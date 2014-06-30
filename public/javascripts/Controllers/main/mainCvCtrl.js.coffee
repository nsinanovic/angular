@CvCtrl = ($scope, $routeParams, $location, $q, cvData, $translate) ->
  $translate.use('ba')
  $scope.changeLanguage  = (key) ->
    $translate.use(key)

  $scope.data =
    cvData: cvData.data
    currentCv:
      naslov: ''
      dodatno: ''
      obrazovanje: ''
      strucnaSprema:''
      radnoIskustvo:''
      jezici:''
      vjestine:''
      ostaleInformacije:''

  $scope.data.cvId = $routeParams.cvId

  $scope.navNewCv = ->
    $location.url('/cv/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.editCv = (cvId) ->
    $location.url('/cv/edit/'+cvId)

  # This will be run once the loadPosts successfully completes (or immediately
  # if data is already loaded)
  $scope.prepCvsData = ->
    cv = _.findWhere(cvData.data.cvs, { id: parseInt($scope.data.cvId) })
    $scope.data.currentCv.naslov = cv.naslov
    $scope.data.currentCv.dodatno = cv.dodatno
    $scope.data.currentCv.obrazovanje = cv.obrazovanje
    $scope.data.currentCv.strucnaSprema = cv.strucnaSprema
    $scope.data.currentCv.radnoIskustvo = cv.radnoIskustvo
    $scope.data.currentCv.jezici = cv.jezici
    $scope.data.currentCv.vjestine = cv.vjestine
    $scope.data.currentCv.ostaleInformacije = cv.ostaleInformacije
    $scope.data.currentCv.id = cv.id

  # Create promise to be resolved after posts load
  @deferred = $q.defer()
  @deferred.promise.then($scope.prepCvsData)

  # Provide deferred promise chain to the loadPosts function
  cvData.loadCvs(@deferred)


@CvCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'cvData']