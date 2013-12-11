#import <Cordova/CDV.h>
#import "Gojira.h"
#import "GojiraViewController.h"


@implementation Gojira

@synthesize screenBounds;
// We keep the instance (should only have one) of our Gojira class stored in this global var
static Gojira *gojiraInstance;

- (Gojira *)initWithWebView:(UIWebView *)theWebView
{
    self.screenBounds = [[UIScreen mainScreen] bounds];
    self = [super initWithWebView:theWebView];
    gojiraInstance = self;
    return self;
}

- (void)launch:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult *pluginResult = nil;
    NSString *url = [command argumentAtIndex:0];

    if (url != nil && [url length] > 0) {

        GojiraViewController *viewController = [[GojiraViewController alloc]
                                                initWithFolderName:@"www"
                                                andStartPage:url];

        // Instanciate our NavController
        self.navController = [[UINavigationController alloc] initWithRootViewController:viewController];
        self.navController.navigationBarHidden = YES;

        [self.viewController presentViewController:self.navController animated:NO completion:nil];
    }

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:[command callbackId]];
}

- (void)stop
{

}

- (void)newViewCtrl:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult *pluginResult = nil;
    NSString *url = [command.arguments objectAtIndex:0];

    GojiraViewController *viewController = [[GojiraViewController alloc]
                                            initWithFolderName:@"www"
                                            andStartPage:url];
    //[viewController.webView stringByEvaluatingJavaScriptFromString:@"setTimeout(function(){alert('hi');}, 500);"];

    [self.navController pushViewController:viewController animated:YES];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:[command callbackId]];
}

- (void)back:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult *pluginResult = nil;
    //NSString *url = [command.arguments objectAtIndex:0];
    [self.navController popViewControllerAnimated:YES];
    //[super writeJavascript:@"alert('hi')"];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:[command callbackId]];
}

@end
