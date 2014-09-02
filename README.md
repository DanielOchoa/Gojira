Gojira
======

**Update: I will soon start working on this project again. Multi pages are difficult since you lose the state of your app and it makes it very difficult to handle multi-page apps as one.

This is a Cordova Plugin that allows you to create native transitions with JS thus allowing you to create a multi-page application. In Other words - a hybrid application with native navigation. Mind. Blown.

Usage
-----

This starts the plugin. It will immediately replace the current webView with the one passed as the argument. Loads the file from inside the www directory. It is recomended that you do not remove the loading screen cordova provides until you call this.
```javascript
gojira.launch('someFile.html');
```

This stacks a new webview into the current navigation controller.
```javascript
gojira.newView('someFile.html');
```

This goes back to the previous view.
```javascript
gojira.back();
```

This sends a message from one view to another.
```javascript
gojira.postMessage({data: 'someData'});
```

Set this function anywhere to intercept an incoming message.
```javascript
window.message = function(msg) {
  alert('message received!');
  if(msg.data === 'someData') {
    console.log(msg.data);
  }
}
```

More magic coming soon!
