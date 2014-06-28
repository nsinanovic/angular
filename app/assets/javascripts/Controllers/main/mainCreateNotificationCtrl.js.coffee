@CreateNotificationCtrl = ($scope, $location, notificationData, kategorijaData, userData, advartismentData) ->

  $scope.data = notificationData.data
  notificationData.loadNotifications(null)

  $scope.formData =
    newKategorija: ''

  $scope.navNewNotification= ->
    $location.url('/notification/new')


  $scope.kategorijas = [
      {kategorija:'Administrativne usluge'},
      {kategorija:'Bankarstvo'},
      {kategorija:'Biotehnologija i farmacija'},
      {kategorija:'Drvna industrija'},
      {kategorija:'Državna služba i uprava'},
      {kategorija:'Ekonomija i finansije'},
      {kategorija:'Elektrotehnika i informatika'},
      {kategorija:'Energetika i rudarstvo'},
      {kategorija:'Frizeri i kozmetičari'},
      {kategorija:'Geologija'},
      {kategorija:'Građevinarstvo i arhitektura'},
      {kategorija:'Komercijala i prodaja'},
      {kategorija:'Konsalting'},
      {kategorija:'Marketing i PR'},
      {kategorija:'Mašinstvo i metalurgija'},
      {kategorija:'Mediji'},
      {kategorija:'Menadžment i upravljanje'},
      {kategorija:'Obrazovanje, kultura i sport'},
      {kategorija:'Osiguranje'},
      {kategorija:'Ostalo'},
      {kategorija:'Policija i zaštitarske usluge'},
      {kategorija:'Političke nauke'},
      {kategorija:'Poljoprivreda i šumarstvo'},
      {kategorija:'Pravo i društvene nauke'},
      {kategorija:'Prevodilačke usluge'},
      {kategorija:'Proizvodnja'},
      {kategorija:'Računovodstvo i revizija'},
      {kategorija:'Socijalne usluge'},
      {kategorija:'Stipendije'},
      {kategorija:'Teleprodaja i telemarketing'},
      {kategorija:'Transport i skladištenje'},
      {kategorija:'Trgovina'},
      {kategorija:'Ugostiteljstvo i turizam'},
      {kategorija:'Umjetnost i dizajn'},
      {kategorija:'Zanatske usluge'}
  ];



  $scope.data1 = kategorijaData.data
  kategorijaData.loadKategorijas(null)

  $scope.data2 = userData.data
  userData.loadUsers(null)

  $scope.data3 = advartismentData.data
  advartismentData.loadAdvartisments(null)

  $scope.viewAdvartisment = (advartismentId) ->
    $location.url('/advartisment/'+advartismentId)


  $scope.navHome = ->
    $location.url('/')

  $scope.createNotification = ->
    notificationData.createNotification($scope.formData)

  $scope.clearNotification = ->

    $scope.formData.newKategorija = ''



@CreateNotificationCtrl.$inject = ['$scope',  '$location', 'notificationData', 'kategorijaData', 'userData', 'advartismentData']