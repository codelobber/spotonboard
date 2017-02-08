//
//  WEPlaydeckRouter.h
//  CGI
//
//  Created by Zubov Ivan on 08/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class WEGlobalRouter;

@interface WEPlaydeckRouter : NSObject



- (id) initWithGlobalRouter:(WEGlobalRouter *)router;
- (void)presentInterfaceFromWindow:(UIWindow *)window;

@end
