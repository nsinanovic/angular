# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./Controllers/main
#= require_tree ./Services/main

# Creates new Angular module called 'Blog'
Blog =angular.module( "Blog", ['pascalprecht.translate'], [
                                                                    "$translateProvider"
                                                                    ($translateProvider) ->

                                                                      # register translation table
                                                                      $translateProvider.translations "en",
                                                                        NEWADVARTISMENT: "Create new advartisment"
                                                                        NEWCV: "Create new CV"
                                                                        PRINTCV: "Print this CV"
                                                                        SAVECV: "Save CV"
                                                                        NOTIFICATION: "Notification"
                                                                        EDUCATION: "Education"
                                                                        WORK: "Work experience"
                                                                        SKILLS: "Personal skills"
                                                                        LANGUAGES: "Languages"
                                                                        DEGREE: "Degree obtained"
                                                                        ADDINFORMATION: "Additional information"
                                                                        TITLE: "Title"
                                                                        DESCRIPTION: "Description"
                                                                        LOCATION: "Location"
                                                                        CATEGORY: "Category"
                                                                        EXPIRE: "Expiration date"
                                                                        REGISTER:"Registration"
                                                                        HOME: "Home"
                                                                        LOGIN: "Login"
                                                                        SEARCH: "Search"
                                                                        ABOUT: "About"
                                                                        CREATE: "Create"
                                                                        CLEAR: "Clear fields"
                                                                        CONTACT: "Contact"
                                                                        UN: "Username"
                                                                        PW: "Password"
                                                                        INFORMATION: "User information"
                                                                        EDITUSER: "Edit settings"
                                                                        FIRST: "Title"
                                                                        PHONE: "Phone number"
                                                                        ADDRESS: "Address"
                                                                        FIRSTNAME: "Fist name"
                                                                        LASTNAME: "Last name"
                                                                        WEBSITE: "Web site"
                                                                        EMAIL: "E-mail"
                                                                        RPW: "Retype password"
                                                                        UP: "User profile"
                                                                        EP: "Edit profile"
                                                                        LOGOUT: "Logout"
                                                                        EDIT: "Edit "
                                                                        EMPLOYER: "Employer"
                                                                        USER: "User"
                                                                        FILTERK: "Filter by category"
                                                                        FILTERL: "Filter by location"
                                                                        ALLEMPLOYER: "Number of registered employers"
                                                                        ALLUSER: "Number of registered users"
                                                                        ALLADVARTISMENTS: "Number of advartisments"
                                                                        READ: "Read more"
                                                                        ALLCVS: "Listing CV"
                                                                        ALLADV: "All advartisments"




                                                                      $translateProvider.translations("ba",
                                                                         NEWADVARTISMENT: "Objavljivanje novog oglasa"
                                                                         NEWCV: "Kreiraj novi CV"
                                                                         PRINTCV: "Isprintaj ovaj CV"
                                                                         SAVECV: "Sačuvaj ovaj CV"
                                                                         NOTIFICATION: "Kategorije za koje dobijam notifikacije"
                                                                         EDUCATION: "Obrazovanje"
                                                                         WORK: "Radno iskustvo"
                                                                         SKILLS: "Vještine"
                                                                         LANGUAGES: "Jezici"
                                                                         DEGREE: "Stručna sprema"
                                                                         ADDINFORMATION: "Dodatne informacije"
                                                                         TITLE: "Naslov"
                                                                         DESCRIPTION: "Kratak opis"
                                                                         LOCATION: "Lokacija"
                                                                         CATEGORY: "Kategorija"
                                                                         EXPIRE: "Oglas otvoren do"
                                                                         REGISTER:"Registacija"
                                                                         HOME: "Početna"
                                                                         LOGIN: "Prijava"
                                                                         SEARCH: "Pretraga"
                                                                         ABOUT: "O nama"
                                                                         CREATE: "Kreiraj"
                                                                         CLEAR: "Očisti polja"
                                                                         CONTACT: "Kontakt"
                                                                         UN: "Korisničko ime"
                                                                         PW: "Šifra"
                                                                         INFORMATION: "Informacije o korisniku"
                                                                         EDITUSER: "Modificiraj podatke"
                                                                         FIRST: "Naziv"
                                                                         PHONE: "Broj telefona"
                                                                         ADDRESS: "Adresa"
                                                                         FIRSTNAME: "Ime"
                                                                         LASTNAME: "Prezime"
                                                                         WEBSITE: "Web stranica"
                                                                         EMAIL: "E-mail"
                                                                         RPW: "Potvrdite šifru"
                                                                         UP: "Korisnički profil"
                                                                         EP: "Modifikacija profila"
                                                                         LOGOUT: "Odjava"
                                                                         EDIT: "Modificiraj"
                                                                         EMPLOYER: "Poslodavac"
                                                                         USER: "Korisnik"
                                                                         FILTERK: "Filtriraj po kategorijama"
                                                                         FILTERL: "Filtriraj po lokacijama"
                                                                         ALLEMPLOYER: "Ukupan broj registriranih firmi"
                                                                         ALLUSER: "Ukupan broj registriranih korisnika"
                                                                         ALLADVARTISMENTS: "Ukupan broj objavljenih oglasa"
                                                                         READ: "Detaljno"
                                                                         ALLCVS: "Lista svih CV-ova"
                                                                         ALLADV: "Svi oglasi"
                                                                      ).preferredLanguage "ba"
                                                                  ])


# Sets up routing
Blog.config(['$routeProvider', ($routeProvider) ->
  # Route for '/post/'
  $routeProvider
  .when('/post/new', { templateUrl: '../assets/mainCreatePost.html', controller: 'CreatePostCtrl' } )
  .when('/post/:postId', { templateUrl: '../assets/mainPost.html', controller: 'PostCtrl' } )
  .when('/cv/new', { templateUrl: '../assets/mainCreateCv.html', controller: 'CreateCvCtrl' } )
  .when('/kategorija/new', { templateUrl: '../assets/mainCreateKatgeorija.html', controller: 'CreateKategorijaCtrl' } )
  .when('/cv/:cvId', { templateUrl: '../assets/mainCv.html', controller: 'CvCtrl' } )
  .when('/kategorija/:kategorijaId', { templateUrl: '../assets/mainKategorija.html', controller: 'KategorijaCtrl' } )
  .when('/user/new', { templateUrl: '../assets/mainCreateUser.html', controller: 'CreateUserCtrl' } )
  .when('/user/:userId', { templateUrl: '../assets/mainUser.html', controller: 'UserCtrl' } )
  .when('/user/edit/:userId', { templateUrl: '../assets/mainEditUser.html', controller: 'EditUserCtrl' } )
  .when('/cv/edit/:cvId', { templateUrl: '../assets/mainEditCv.html', controller: 'EditCvCtrl' } )

  .when('/employer/new', { templateUrl: '../assets/mainCreateEmployer.html', controller: 'CreateEmployerCtrl' } )
  .when('/employer/:employerId', { templateUrl: '../assets/mainEmployer.html', controller: 'EmployerCtrl' } )
  .when('/advartisment/new', { templateUrl: '../assets/mainCreateAdvartisment.html', controller: 'CreateAdvartismentCtrl' } )
  .when('/advartisment/:advartismentId', { templateUrl: '../assets/mainAdvartisment.html', controller: 'AdvartismentCtrl' } )
  .when('/advartisment/:category', { templateUrl: '../assets/mainUser.html', controller: 'CreateAdvartismentCtrl' } )
  .when('/advartismentkategorija/administrativne',{ templateUrl: '../assets/mainAdministrativneUsluge.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/bankarstvo',{ templateUrl: '../assets/mainBankarstvo.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/biotehnologija',{ templateUrl: '../assets/mainBiotehnologijaIFarmacija.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/drvna',{ templateUrl: '../assets/mainDrvnaIndustrija.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/drzavna',{ templateUrl: '../assets/mainDrzavna.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/ekonomija',{ templateUrl: '../assets/mainEkonomija.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/elektrotehnika',{ templateUrl: '../assets/mainElektrotehnika.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/energetika',{ templateUrl: '../assets/mainEnergetika.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/frizeri',{ templateUrl: '../assets/mainFrizeri.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/geologija',{ templateUrl: '../assets/mainGeologija.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/gradjevinarstvo',{ templateUrl: '../assets/mainGradjevinarstvo.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/komercijala',{ templateUrl: '../assets/mainKomercijala.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/konsalting',{ templateUrl: '../assets/mainKonsalting.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/marketing',{ templateUrl: '../assets/mainMarketing.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/masinstvo',{ templateUrl: '../assets/mainMasinstvo.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/mediji',{ templateUrl: '../assets/mainMediji.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/menadzment',{ templateUrl: '../assets/mainMenadzment.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/obrazovanje',{ templateUrl: '../assets/mainObrazovanje.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/osiguranje',{ templateUrl: '../assets/mainOsiguranje.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/ostalo',{ templateUrl: '../assets/mainOstalo.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/policija',{ templateUrl: '../assets/mainPolicija.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/politicke',{ templateUrl: '../assets/mainPoliticke.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/poljoprivreda',{ templateUrl: '../assets/mainPoljoprivreda.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/pravo',{ templateUrl: '../assets/mainPravo.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/prevodilacke',{ templateUrl: '../assets/mainPrevodilacke.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/proizvodnja',{ templateUrl: '../assets/mainProizvodnja.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/racunovodstvo',{ templateUrl: '../assets/mainRacunovodstvo.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/socijalne',{ templateUrl: '../assets/mainSocijalne.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/stipendije',{ templateUrl: '../assets/mainStipendije.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/teleprodaja',{ templateUrl: '../assets/mainTeleprodaja.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/transport',{ templateUrl: '../assets/mainTransport.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/trgovina',{ templateUrl: '../assets/mainTrgovina.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/ugostiteljstvo',{ templateUrl: '../assets/mainUgostiteljstvo.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/umjetnost',{ templateUrl: '../assets/mainUmjetnost.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/zanatske',{ templateUrl: '../assets/mainZanatske.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/zdravstvo',{ templateUrl: '../assets/mainZdravstvo.html', controller: 'IndexCtrl' })
  .when('/advartismentlokacija/sarajevo',{ templateUrl: '../assets/mainSarajevo.html', controller: 'IndexCtrl' })
  .when('/advartismentlokacija/banjaluka',{ templateUrl: '../assets/mainBanjaLuka.html', controller: 'IndexCtrl' })
  .when('/advartismentlokacija/tuzla',{ templateUrl: '../assets/mainTuzla.html', controller: 'IndexCtrl' })
  .when('/advartismentlokacija/zenica',{ templateUrl: '../assets/mainZenica.html', controller: 'IndexCtrl' })
  .when('/advartismentlokacija/zavidovici',{ templateUrl: '../assets/mainZavidovici.html', controller: 'IndexCtrl' })
  .when('/advartismentlokacija/travnik',{ templateUrl: '../assets/mainTravnik.html', controller: 'IndexCtrl' })
  .when('/advartismentlokacija/mostar',{ templateUrl: '../assets/mainMostar.html', controller: 'IndexCtrl' })
  .when('/advartismentlokacija/bihac',{ templateUrl: '../assets/mainBihac.html', controller: 'IndexCtrl' })
  .when('/advartismentlokacija/brcko',{ templateUrl: '../assets/mainBrcko.html', controller: 'IndexCtrl' })
  .when('/main/about',{ templateUrl: '../assets/about.html', controller: 'IndexCtrl' })
  .when('/main/contact',{ templateUrl: '../assets/contact.html', controller: 'IndexCtrl' })





# Default
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' } )

])

Blog.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])