// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.login', 'starter.controllers', 'starter.profilePageCtrl', 'starter.ExerciseListCtrl', 'starter.ExerciseDetailCtrl', 'starter.filters', 'naturalSort', 'dataservices'])

.run(function($ionicPlatform, runLogin, localStorage, dataService) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if(window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if(window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }

    runLogin.openLogin();

  });
})

.config(function($stateProvider, $urlRouterProvider, $locationProvider) {


  // $locationProvider.html5Mode(true);

  $stateProvider
    .state('app', {
      url: "/app",
      abstract: true,
      templateUrl: "templates/main.html"
    })
    .state('app.profiel', {
      url: "/profiel",
      views: {
        'profiel': {
          templateUrl: "templates/profile.html",
          controller: 'profileCtrl'
        }
      }
    })
    .state('app.oefeningen', {
      url: "/oefeningen",
      views: {
        'oefeningen': {
          templateUrl: "templates/oefeningen.html",
          controller: 'ExerciseListCtrl'
        }
      }
    })
    .state('app.oefening', {
      url: "/oefening/:id",
      views: {
        'oefening': {
          templateUrl: "templates/oefening.html",
          controller: 'ExerciseDetailCtrl'
        }
      }
    })
    // .state('oefeningen', {
    //   url: "/oefeningen",
    //   templateUrl: "templates/oefeningen.html",
    //   controller: 'ExerciseListCtrl'
    // })
    // .state('profiel', {
    //   url: "/profiel",
    //   templateUrl: "templates/profile.html",
    //   controller: 'profileCtrl'
    // })
    // .state('tabs.home', {
    //   url: "/home",
    //   views: {
    //     'home-tab': {
    //       templateUrl: "templates/testHome.html",
    //       controller: 'HomeTabCtrl'
    //     }
    //   }
    // })
    // .state('tabs.about', {
    //   url: "/about",
    //   views: {
    //     'about-tab': {
    //       templateUrl: "templates/testAbout.html"
    //     }
    //   }
    // })
    // .state('app.doneExercise', {
    //   url: "/doneExercise",
    //   views: {
    //     'menuContent' :{
    //       templateUrl: "templates/doneExercise.html",
    //       controller: 'doneExerciseCtrl'
    //     }
    //   }
    // })

    ;

    // if none of the above states are matched, use this as the fallback
    $urlRouterProvider.otherwise('app/oefeningen');
})

;

