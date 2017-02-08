//
//  WEGlobalRouter.h
//  CGI
//
//  Created by Zubov Ivan on 08/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WEGlobalRouter : NSObject

- (void) installRootViewControllerIntoWindow:(UIWindow *) window;
- (UIViewController *) getViewControllerWithIdentifer:(NSString *) identifier;
- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window;
@end
