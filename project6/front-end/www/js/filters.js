angular.module('starter.filters', [])

.filter('reverse', function() {
  return function(items) {
  	if (items) {
	  	if (items.length > 1) {
	    	return items.slice().reverse();
	    } else {
	    	return items;
	    }
    }
  };
})
.filter('capitalize', function() {
	return function(input, all) {
	  return (!!input) ? input.replace(/([^\W_]+[^\s-]*) */g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();}) : '';
	}
})
.filter('firstLetterFilter', function() {
	return function (string) {
		return string.charAt(0);
	}
})

;