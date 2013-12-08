#import "Gojira.h"
#import <Cordova/CDV.h>

@implementation Gojira

@synthesize controllerStack;
@synthesize filename;

- (Gojira *)initWithWebView:(UIWebView *)theWebView
{
  self = [super initWithWebView:theWebView];
  return self;
}

- (void)launch:(CDVInvokedUrlCommand *)command
{
  CDVPluginResult *pluginResult = nil;
  NSString *url = [command.arguments objectAtIndex:0];

  if (url != nil && [url length] > 0) {
    // instanciate new gojiraviewctrl with view set to absoluteURL here
    GojiraViewController *newView = [GojiraViewController new];
    newView.startPage = url;

    self.navController = [[UINavigationController alloc] initWithRootViewController:newView];
  }

  pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:[command callbackId]];
}

- (void)stop
{

}

- (void)newViewCtrl:(CDVInvokedUrlCommand *)command
{

}

- (void)back
{

}

@end
