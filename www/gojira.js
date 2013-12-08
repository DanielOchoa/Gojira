gojira = function(callback) {
  cordova.exec(callback, callback(false), 'Gojira', 'launch', []);
}

gojira = function(callback) {
  cordova.exec(callback, callback(false), 'Gojira', 'stop', []);
}

gojira.newView = function(name) {
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
}
  
