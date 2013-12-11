#import <Cordova/CDV.h>
#import "GojiraViewController.h"

@interface Gojira : CDVPlugin

@property (nonatomic, retain) UINavigationController *navController;
@property (nonatomic) CGRect screenBounds;

- (void)launch:(CDVInvokedUrlCommand *)command;
- (void)stop;
- (void)newView:(CDVInvokedUrlCommand *)command;
- (void)back:(CDVInvokedUrlCommand *) command;

// Class Methods
+ (void)newViewCtrl:(CDVInvokedUrlCommand *)command;

@end

