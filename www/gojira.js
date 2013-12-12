gojira = {
  launch: function(path) {
    cordova.exec(null, null, 'Gojira', 'launch', [path]);
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
      'newView',
      [path]
    );
  },
  back: function() {
    cordova.exec(null, null, 'Gojira', 'back', ['true']);
  },
  postMessage: function(msg) {
    msg = JSON.stringify(msg);
    cordova.exec(null, null, 'Gojira', 'postMessage', [msg]);
  },
  send: function(msg) {
    if (window.message) {
      message(msg);
    }
  }
}
