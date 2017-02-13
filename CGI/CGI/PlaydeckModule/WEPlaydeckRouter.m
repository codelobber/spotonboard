//
//  WEPlaydeckRouter.m
//  CGI
//
//  Created by Zubov Ivan on 08/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import "WEPlaydeckRouter.h"
#import "WEGlobalRouter.h"

#import "WEPlaydeckVC.h"
#import "WEPlaydeck.h"
#import "WESession.h"


@interface WEPlaydeckRouter()

@property (nonatomic,strong) WEGlobalRouter * gRouter;

@end

@implementation WEPlaydeckRouter

- (id) init{
	return [self initWithGlobalRouter:nil];
}

- (id) initWithGlobalRouter:(WEGlobalRouter *)router{
	self = [super init];
	if (self){
		self.gRouter = router;
	}
	return self;
}

- (void) initViper:(WEPlaydeckVC *)view{
	WEPlaydeck * presentor = [WEPlaydeck new];
	WESession * interactor = [WESession new];

	view.presentorDelegate = presentor;
	presentor.viewDelegate = view;
	presentor.interactorDelegate = interactor;
	interactor.presentorDelegate = presentor;
}

- (void)presentInterfaceFromWindow:(UIWindow *)window{
	WEPlaydeckVC * view = (WEPlaydeckVC *) [self.gRouter getViewControllerWithIdentifer:@"WEPlaydeckVC"];
	[self initViper:view];
	[self.gRouter showRootViewController:view inWindow:window];
}

#pragma mark - transitions

- (void)presentAddInterface{
	//[self.addWireframe presentAddInterfaceFromViewController:self.listViewController];
}

@end
