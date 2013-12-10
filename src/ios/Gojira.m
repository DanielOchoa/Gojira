#import <Cordova/CDV.h>
#import "Gojira.h"
#import "GojiraViewController.h"


@implementation Gojira

@synthesize screenBounds;

- (Gojira *)initWithWebView:(UIWebView *)theWebView
{
    self.screenBounds = [[UIScreen mainScreen] bounds];
    self = [super initWithWebView:theWebView];
    return self;
}

- (void)launch:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult *pluginResult = nil;
    NSString *url = [command.arguments objectAtIndex:0];

    if (url != nil && [url length] > 0) {
        UIViewController *newView = [[UIViewController alloc] initWithNibName:nil bundle:nil];
        CDVViewController *viewController = [CDVViewController new];
        viewController.wwwFolderName = @"www";
        viewController.startPage = url;

        [newView setView:[[UIView alloc] init]];
        newView.view.frame = self.screenBounds;
        viewController.view.frame = self.screenBounds;
        [newView.view addSubview:viewController.view];


        self.navController = [[UINavigationController alloc] initWithRootViewController:newView];
        self.navController.navigationBarHidden = YES;

        [[[self.appDelegate window] rootViewController] presentViewController:self.navController animated:YES completion:nil];
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

    UIViewController *newView = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    CDVViewController *viewController = [CDVViewController new];
    viewController.wwwFolderName = @"www";
    viewController.startPage = url;

    [newView setView:[[UIView alloc] init]];
    newView.view.frame = self.screenBounds;
    viewController.view.frame = self.screenBounds;
    [newView.view addSubview:viewController.view];

    [self.navController pushViewController:newView animated:YES];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:[command callbackId]];
}

- (void)back:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult *pluginResult = nil;
    //NSString *url = [command.arguments objectAtIndex:0];
    NSLog(@"running!!");
    [self.navController popViewControllerAnimated:YES];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:[command callbackId]];
}

@end
