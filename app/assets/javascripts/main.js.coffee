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
  .when('/cv/:cvId', { templateUrl: '../assets/mainCv.html', controller: 'CvCtrl' } )
 # .when('/cv/edit/:cvId', { templateUrl: '../assets/mainEditCv.html', controller: 'EditCvCtrl' } )
  .when('/user/new', { templateUrl: '../assets/mainCreateUser.html', controller: 'CreateUserCtrl' } )
  .when('/user/:userId', { templateUrl: '../assets/mainUser.html', controller: 'UserCtrl' } )
  .when('/advartisment/new', { templateUrl: '../assets/mainCreateAdvartisment.html', controller: 'CreateAdvartismentCtrl' } )
  .when('/advartisment/:advartismentId', { templateUrl: '../assets/mainUser.html', controller: 'AdvartismentCtrl' } )

  # Default
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' } )

])

Blog.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])