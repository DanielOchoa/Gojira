#import "GojiraViewController.h"
#import <Cordova/CDVViewController.h>

@interface GojiraViewController ()

@end

@implementation GojiraViewController

@synthesize cViewController;

- (id)initWithFolderName:(NSString *)aFolderName andStartPage:(NSString *)aStartPage
{
    self = [super init];
    self.view.frame = [[UIScreen mainScreen] bounds];

    // CDVViewController
    self.cViewController = [CDVViewController new];
    self.cViewController.wwwFolderName = aFolderName;
    self.cViewController.startPage = aStartPage;
    self.cViewController.view.frame = self.view.frame;

    [self.view addSubview:self.cViewController.view];

    return self;
}

@end
