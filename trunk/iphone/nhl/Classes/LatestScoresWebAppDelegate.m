#import "LatestScoresWebAppDelegate.h"
#import "LatestScoresWebViewController.h"

@implementation LatestScoresWebAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	CGRect screenBounds = [[UIScreen mainScreen] bounds];
	self.window = [[[UIWindow alloc] initWithFrame:screenBounds] autorelease];
	viewController = [[LatestScoresWebViewController alloc] init];
	[window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[viewController release];
    [window release];
    [super dealloc];
}


@end
