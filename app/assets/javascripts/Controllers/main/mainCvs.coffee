@CvsCtrl = ( $scope, $location, $http, cvData, $translate) ->
  $scope.changeLanguage  = (key) ->
    $translate.use(key)

    $scope.data = cvData.data
    cvData.loadCvs(null)


    $scope.viewCv = (cvId) ->
      $location.url('/cv/'+cvId)





@CvsCtrl.$inject = [ '$scope', '$location', '$http', 'cvData','$translate']