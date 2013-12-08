#import <Cordova/CDV.h>
#import <GojiraViewController.h>

@interface Gojira : CDVPlugin

@property (nonatomic, retain) NSMutableArray *controllerStack;
@property (nonatomic, copy) NSString *filename;
@property (nonatomic, retain) UINavigationController *navController;

- (void)launch:(CDVInvokedUrlCommand *)command
- (void)stop
- (void)newViewCtrl:(CDVInvokedUrlCommand *)command;
- (void)back;

@end

