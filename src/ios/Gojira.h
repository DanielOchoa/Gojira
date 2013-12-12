#import <Cordova/CDV.h>
#import "GojiraViewController.h"

@interface Gojira : CDVPlugin

@property (nonatomic, retain) UINavigationController *navController;

- (void)launch:(CDVInvokedUrlCommand *)command;
- (void)stop;
- (void)newView:(CDVInvokedUrlCommand *)command;
- (void)back:(CDVInvokedUrlCommand *) command;
- (void)postMessage:(CDVInvokedUrlCommand *)command;

// Class Methods
+ (void)newViewCtrl:(CDVInvokedUrlCommand *)command;

@end

