angular.module('dataservices',[])

.factory('localStorage', ['$window', function($window) {
	return {
		set: function(key, value) {
		  $window.localStorage[key] = value;
		},
		get: function(key) {
		  return $window.localStorage[key];
		},
		setObject: function(key, value) {
		  $window.localStorage[key] = JSON.stringify(value);
		},
		getObject: function(key) {
		  return angular.fromJson($window.localStorage[key]);
		}
	}
}])

.factory('dataService', ['$http','localStorage', '$timeout', function($http, localStorage, $timeout) {
	return {
		getUsertoken: function($logindata) {
			var url = "http://backend-p6:8888/api/auth/login?email=" + $logindata.username + "&pwd=" + $logindata.password;
			var userInfo = {};
			var self = this;
			var login = {};

			return $http.get(url).success(function(data) {
				if (data.result === true) {
				  	userInfo.user_token = data.token;
					userInfo.user_id = data.userID;
					self.getUserdata(userInfo);
					localStorage.setObject('user', userInfo);
				}
			});
		},
		checkUserdata: function($logindata) {
			var url = "http://backend-p6:8888/api/Patient/" + $logindata.user_id;

			var userDataPromise = $http.get(url, {headers: {'X-Silverstripe-Apitoken': $logindata.user_token }});

			return userDataPromise;
		},
		getUserdata: function($logindata) {
			var url = "http://backend-p6:8888/api/Patient/" + $logindata.user_id;
			var obj = {};

			$http.get(url, {headers: {'X-Silverstripe-Apitoken': $logindata.user_token }}).success(function(data) {
			  obj.data = data;
			  localStorage.setObject('userdata', data);
			});
		}
	}

}])

;
