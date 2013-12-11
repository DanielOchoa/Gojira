#import <Cordova/CDV.h>
#import "Gojira.h"
#import "GojiraViewController.h"


@implementation Gojira

@synthesize screenBounds;
static Gojira *gojiraInstance;

- (Gojira *)initWithWebView:(UIWebView *)theWebView
{
    self.screenBounds = [[UIScreen mainScreen] bounds];
    self = [super initWithWebView:theWebView];

    // will only get set the first time this class creates an instance.
    if (!gojiraInstance) {
        gojiraInstance = self;
    }
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
    // do we even need to return something?
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:[command callbackId]];
}

- (void)stop
{

}

- (void)newView:(CDVInvokedUrlCommand *)command
{
    [Gojira newViewCtrl:[command argumentAtIndex:0]];
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:[command callbackId]];
}

+ (void)newViewCtrl:(NSString *)url
{
    GojiraViewController *viewController = [[GojiraViewController alloc]
                                            initWithFolderName:@"www"
                                            andStartPage:url];

    // push our view controller into the stack
    [gojiraInstance.navController pushViewController:viewController animated:YES];
}

- (void)back:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult *pluginResult = nil;
    //NSString *url = [command.arguments objectAtIndex:0];
    [self.navController popViewControllerAnimated:YES];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:[command callbackId]];
}

@end

// TODO: write these down so you can remember the method names
//[viewController.webView stringByEvaluatingJavaScriptFromString:@"setTimeout(function(){alert('hi');}, 500);"];
//[super writeJavascript:@"alert('hi')"];
