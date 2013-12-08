#import <Cordova/CDV.h>

@interface Gojira : CDVPlugin

@property (nonatomic, retain) NSMutableArray *controllerStack;
@property (nonatomic, copy) NSString *filename;

- (void)launch:(CDVInvokedUrlCommand *)command;
- (void)stop:(CDVInvokedUrlCommand *)command;

@end

