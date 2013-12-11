#import <UIKit/UIKit.h>
#import <Cordova/CDVViewController.h>

@interface GojiraViewController : UIViewController

@property (nonatomic, retain) CDVViewController *cViewController;

- (id)initWithFolderName:(NSString *)aFolderName andStartPage:(NSString *)aStartPage;

@end
