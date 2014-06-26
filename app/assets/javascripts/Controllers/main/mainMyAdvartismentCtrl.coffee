@MyAdvartismentCtrl = ( $scope,$routeParams, $location, $http, advartismentData,userData, employerData, $translate) ->
  $translate.use('ba')
  $scope.changeLanguage  = (key) ->
    $translate.use(key)


  $scope.data = advartismentData.data
  advartismentData.loadAdvartisments(null)

  $scope.data.employer = $routeParams.employer


  $scope.data1 = userData.data
  userData.loadUsers(null)

  $scope.data2 = employerData.data
  employerData.loadEmployers(null)


  $scope.viewAdvartisment = (advartismentId) ->
    $location.url('/advartisment/'+advartismentId)

  $scope.navNewAdvartisment = ->
    $location.url('/advartisment/new')



@MyAdvartismentCtrl.$inject = [ '$scope', '$routeParams','$location', '$http', 'advartismentData','userData', 'employerData','$translate']