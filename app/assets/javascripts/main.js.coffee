# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./Controllers/main
#= require_tree ./Services/main

# Creates new Angular module called 'Blog'
Blog = angular.module('Blog', [])

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
  .when('/advartisment/new', { templateUrl: '../assets/mainCreateAdvartisment.html', controller: 'CreateAdvartismentCtrl' } )
  .when('/advartisment/:advartismentId', { templateUrl: '../assets/mainAdvartisment.html', controller: 'AdvartismentCtrl' } )
  .when('/advartisment/:category', { templateUrl: '../assets/mainUser.html', controller: 'CreateAdvartismentCtrl' } )
  .when('/advartismentkategorija/administrativne',{ templateUrl: '../assets/mainAdministrativneUsluge.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/biotehnologija',{ templateUrl: '../assets/mainBiotehnologijaIFarmacija.html', controller: 'IndexCtrl' })
  .when('/advartismentkategorija/drvna',{ templateUrl: '../assets/mainDrvnaIndustrija.html', controller: 'IndexCtrl' })

  # Default
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' } )

])

Blog.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])