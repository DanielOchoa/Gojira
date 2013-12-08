gojira = {
  launch: function(path) {
    cordova.exec(nil, nil, 'Gojira', 'launch', [path]);
  },
  stop: function() {
    cordova.exec(callback, callback(false), 'Gojira', 'stop', []);
  },
  newView: function(path) {
    cordova.exec(
      function() { 
	console.log('Gojira View successfully added.'); 
      },
      function() {
	console.log('error instanciationg Gojira View.');
      },
      'Gojira', 
      'newViewCtrl',
      [name]
    );
  },
  back: function() {
    cordova.exec(nil, nil, 'Gojira', 'back', []);
  }
}
