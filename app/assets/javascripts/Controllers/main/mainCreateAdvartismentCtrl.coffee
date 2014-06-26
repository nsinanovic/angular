@CreateAdvartismentCtrl = ($scope, $location, advartismentData, $translate) ->
 $translate.use('ba')
 $scope.changeLanguage  = (key) ->
  $translate.use(key)
  $scope.data = advartismentData.data
  advartismentData.loadAdvartisments(null)

  $scope.colors = [
    {name:'Administrativne usluge'},
    {name:'Bankarstvo'},
    {name:'Biotehnologija i farmacija'},
    {name:'Drvna industrija'},
    {name:'Državna služba i uprava'},
    {name:'Ekonomija i finansije'},
    {name:'Elektrotehnika i informatika'},
    {name:'Energetika i rudarstvo'},
    {name:'Frizeri i kozmetičari'},
    {name:'Geologija'},
    {name:'Građevinarstvo i arhitektura'},
    {name:'Komercijala i prodaja'},
    {name:'Konsalting'},
    {name:'Marketing i PR'},
    {name:'Mašinstvo i metalurgija'},
    {name:'Mediji'},
    {name:'Menadžment i upravljanje'},
    {name:'Obrazovanje, kultura i sport'},
    {name:'Osiguranje'},
    {name:'Ostalo'},
    {name:'Policija i zaštitarske usluge'},
    {name:'Političke nauke'},
    {name:'Poljoprivreda i šumarstvo'},
    {name:'Pravo i društvene nauke'},
    {name:'Prevodilačke usluge'},
    {name:'Proizvodnja'},
    {name:'Računovodstvo i revizija'},
    {name:'Socijalne usluge'},
    {name:'Stipendije'},
    {name:'Teleprodaja i telemarketing'},
    {name:'Transport i skladištenje'},
    {name:'Trgovina'},
    {name:'Ugostiteljstvo i turizam'},
    {name:'Umjetnost i dizajn'},
    {name:'Zanatske usluge'}
  ];

  $scope.formData =
    newAdvartismentTitle: ''
    newAdvartismentDescription: ''
    newAdvartismentLocation: ''
    newAdvartismentCategory: ''
    newAdvartismentExpire: ''

  $scope.navNewAdvartisment = ->
    $location.url('/advartisment/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createAdvartisment = ->
    advartismentData.createAdvartisment($scope.formData)

  $scope.clearAdvartisment = ->
    $scope.formData.newAdvartismentTitle = ''
    $scope.formData.newAdvartismentDescription = ''
    $scope.formData.newAdvartismentLocation = ''
    $scope.formData.newAdvartismentCategory = ''
    $scope.formData.newAdvartismentExpire = ''


@CreateAdvartismentCtrl.$inject = ['$scope', '$location', 'advartismentData', '$translate']