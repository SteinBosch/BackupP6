angular.module('starter.login', ['dataservices'])

  .factory('runLogin', ['$rootScope', '$ionicModal', 'dataService', '$timeout', '$state', '$stateParams', 'localStorage', function($rootScope, $ionicModal, dataService, $timeout, $state, $stateParams, localStorage) {
    return {
      openLogin: function() {
        $rootScope.loginData = {};

        // Hier wordt de modal aangemaakt
        $ionicModal.fromTemplateUrl('templates/login.html', {
          scope: $rootScope,
          animation: 'fade-in' // Fade in jeej!
        }).then(function(modal) {

        // Toon modal en verberg loginform in eerste instantie
        modal.show();
        $rootScope.modal = modal;
        $rootScope.formclass = "hidden";

        // Check of er een user aanwezig is in de localhost
        var user = localStorage.getObject('user');
        // Als er een user aanwezig is:
        if(user) {
          // Check user token door data op proberen te halen
          dataService.checkUserdata(user).success(function(data) {
            console.log('valid token, get data now and go on');
            localStorage.setObject('userdata', data);

            // verberg de login als de token valide is (data is opgehaald)
            $rootScope.closeLogin();
            // Ga naar state waar de gebruiker in eerste instantie naartoe wilde
            $state.transitionTo($state.current, $stateParams, {
                reload: true,
                inherit: false,
                notify: true
            });
            // $state.go('home.oefeningen');
            console.log('uitgevoerd');

          // Toon inlogformulier als token niet meer valide is (data kan niet worden opgehaald)
          }).error(function() {
            console.log('invalid token! Show login');
            $rootScope.formclass = "";
            $rootScope.loaderclass = "hidden";
            $rootScope.messageclass = "hidden";
          });
        } else {
          // Anders toon het inlogformulier
          console.log('User does not exist');
          $rootScope.formclass = "";
          $rootScope.loaderclass = "hidden";
          $rootScope.messageclass = "hidden";
        }

        });

        // De modal wordt gesloten als deze functie wordt aangeroepen
        $rootScope.closeLogin = function() {
          $rootScope.modal.hide();
        };

        // Login functie
        $rootScope.doLogin = function() {
          $rootScope.loaderclass = " ";
          $rootScope.messageclass = "hidden";
          $rootScope.loginData.succes = "";
          console.log('Doing login', $rootScope.loginData);

          //De factory van get user token wordt hier aangeroepen waardoor de gberuiker kan worden ingelogd
          dataService.getUsertoken($rootScope.loginData).success(function(data) {
            $rootScope.loaderclass = "hidden";
            if (data.result === true) {
              $rootScope.messageclass = " ";
              $rootScope.loginData.succes = "U bent succesvol ingelogd";
              $timeout(function() {
                $rootScope.closeLogin();
                $state.transitionTo($state.current, $stateParams, {
                    reload: true,
                    inherit: false,
                    notify: true
                });
              }, 1000);
            } else {
              $rootScope.messageclass = " ";
              $rootScope.loginData.succes = "Authenticatie fout, probeer opnieuw";
            }
          });
        };
      }
  }

  }])