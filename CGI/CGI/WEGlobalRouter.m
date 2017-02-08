//
//  WEGlobalRouter.m
//  CGI
//
//  Created by Zubov Ivan on 08/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import "WEGlobalRouter.h"
#import "WEPlaydeckRouter.h"

@implementation WEGlobalRouter

- (id)init
{
	if ((self = [super init]))
	{
		[self configureRouting];
	}
	
	return self;
}

- (void) configureRouting{
	
}

- (void) installRootViewControllerIntoWindow:(UIWindow *) window{
	WEPlaydeckRouter * playdeck = [[WEPlaydeckRouter alloc] initWithGlobalRouter:self];
	[playdeck presentInterfaceFromWindow:window];
}

#pragma mark - ViewController

- (UIViewController *) getViewControllerWithIdentifer:(NSString *) identifier{
	UIStoryboard *storyboard = [self mainStoryboard];
	UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
	return viewController;
}


- (UIStoryboard *)mainStoryboard{
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
	return storyboard;
}

#pragma mark - Controller

- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window{
	UINavigationController *navigationController = [self navigationControllerFromWindow:window];
	navigationController.viewControllers = @[viewController];
}


- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window{
	UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
	return navigationController;
}

@end
