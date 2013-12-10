#import <Cordova/CDV.h>
#import "GojiraViewController.h"

@interface Gojira : CDVPlugin

@property (nonatomic, retain) UINavigationController *navController;
@property (nonatomic) CGRect screenBounds;

- (void)launch:(CDVInvokedUrlCommand *)command;
- (void)stop;
- (void)newViewCtrl:(CDVInvokedUrlCommand *)command;
- (void)back:(CDVInvokedUrlCommand *) command;

@end

