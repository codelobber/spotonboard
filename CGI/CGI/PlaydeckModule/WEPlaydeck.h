//
//  WEPlaydeck.h
//  CGI
//
//  Created by Zubov Ivan on 08/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WEPlaydeckDelegate.h"
#import "WEPlaydeckVCDelegate.h"

@interface WEPlaydeck : NSObject <WEPlaydeckDelegate>

//VIPER conectivity
@property (nonatomic,strong) id <WEPlaydeckVCDelegate> viewDelegate;

@end
