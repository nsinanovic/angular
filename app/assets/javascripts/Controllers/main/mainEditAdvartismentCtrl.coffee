@EditAdvartismentCtrl = ($scope, $routeParams, $location, advartismentData) ->

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

  $scope.data = advartismentData.data
  $scope.data.advartismentId = $routeParams.advartismentId
  advartisment = _.findWhere(advartismentData.data.advartisments, { id: parseInt($scope.data.advartismentId) })
  advartismentData.loadAdvartisments(null)


  $scope.formData =
    editAdvartismentTitle: advartisment.title
    editAdvartismentDescription: advartisment.description
    editAdvartismentLocation: advartisment.location
    #editAdvartismentCategory: advartisment.category
    editAdvartismentExpire: advartisment.expire
    editAdvartismentId: advartisment.id

  $scope.navNewAdvartisment = ->
    $location.url('/advartisment/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.updateAdvartisment = ->
    advartismentData.editAdvartisment($scope.formData)
    $location.url('/')

  $scope.removeAdvartisment = ->
    advartismentData.deleteAdvartisment($scope.formData)

  $scope.clearAdvartisment = ->
    $scope.formData.editAdvartismentTitle = ''
    $scope.formData.editAdvartismentDescription = ''
    $scope.formData.editAdvartismentLocation=''
    #$scope.formData.editAdvartismentCategory = ''
    $scope.formData.editAdvartismentExpire = ''



@EditAdvartismentCtrl.$inject = ['$scope', '$routeParams','$location', 'advartismentData']

