@IndexCtrl = ( $scope, $location, $http, advartismentData,userData, employerData, $translate) ->

  $scope.data = advartismentData.data
  advartismentData.loadAdvartisments(null)

  $scope.data1 = userData.data
  userData.loadUsers(null)

  $scope.data2 = employerData.data
  employerData.loadEmployers(null)


  $scope.viewAdvartisment = (advartismentId) ->
    $location.url('/advartisment/'+advartismentId)

  $scope.navNewAdvartisment = ->
    $location.url('/advartisment/new')
 $scope.changeLanguage  = (key) ->
    $translate.use(key);


@IndexCtrl.$inject = [ '$scope', '$location', '$http', 'advartismentData','userData', 'employerData','$translate']