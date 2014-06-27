@CreateNotificationCtrl = ($scope, $location, notificationData, kategorijaData) ->

  $scope.data = notificationData.data
  notificationData.loadNotifications(null)

  $scope.formData =

    newKategorija: ''

  $scope.navNewNotification= ->
    $location.url('/notification/new')

  $scope.data1 = kategorijaData.data
  kategorijaData.loadKategorijas(null)


  $scope.navHome = ->
    $location.url('/')

  $scope.createNotification = ->
    notificationData.createNotification($scope.formData)

  $scope.clearNotification = ->

    $scope.formData.newKategorija = ''



@CreateNotificationCtrl.$inject = ['$scope', '$location', 'notificationData', 'kategorijaData']