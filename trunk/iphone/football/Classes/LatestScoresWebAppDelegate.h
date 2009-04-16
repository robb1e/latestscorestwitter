#import <UIKit/UIKit.h>

@class LatestScoresWebViewController;

@interface LatestScoresWebAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	LatestScoresWebViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LatestScoresWebViewController *viewController;

@end

