@EditCvCtrl = ($scope, $location, $q, cvId) ->

  $scope.data = cvData.data
  cvData.loadCvs(null)

  $scope.formData =
    newCvNaslov: ''
    newCvDodatno: ''

  $scope.navEditCv = ->
    $location.url('/cv/:cvId')

  $scope.navHome = ->
    $location.url('/')

  $scope.editCv = ->
    cvData.editCv($scope.cvId)

  $scope.clearCv = ->
    $scope.formData.newCvNaslov = ''
    $scope.formData.newCvDodatno = ''


@EditCvCtrl.$inject = ['$scope', '$routeParams', '$location', '$q', 'cvId']