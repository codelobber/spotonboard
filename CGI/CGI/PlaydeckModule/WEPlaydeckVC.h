//
//  WEPlaydeckVC.h
//  CGI
//
//  Created by Zubov Ivan on 08/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WEPlaydeckVCDelegate.h"
#import "WEPlaydeckDelegate.h"

#import "WEDeskView.h"


@interface WEPlaydeckVC : UIViewController <WEPlaydeckVCDelegate>

//VIPER conectivity
@property (nonatomic,strong) id presentorDelegate;


@property (nonatomic,strong) WEDeskView * deskView;


@end
