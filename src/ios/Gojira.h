#import <Cordova/CDV.h>
#import <GojiraViewController.h>

@interface Gojira : CDVPlugin

@property (nonatomic, retain) NSMutableArray *controllerStack;
@property (nonatomic, copy) NSString *filename;

- (void)launch
- (void)stop
- (void)newViewCtrl:(CDVInvokedUrlCommand *)command;

@end

