Gojira
======

This is a Cordova Plugin that allows you to create native transitions with JS thus allowing you to create a multi-page application. In Other words - a hybrid application with native navigation. Mind. Blown.

Support for messaging between views coming soon.

Usage
-----

This starts the plugin. It will immediately replace the current webView with the one passed as the argument. Loads the file from inside the www directory. It is recomended that you do not remove the loading screen cordova provides until you call this.
```javascript
gojira.launch('someFile.html');
```

This stacks a new webview into the current navigation controller.
```javascript
gojira.newView('someFile.html');

This goes back to the previous view.
```javascript
gojira.back()
```

More magic coming soon!
