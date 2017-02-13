//
//  WESession.h
//  CGI
//
//  Created by Zubov Ivan on 13/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WEPlaydeckDefs.h"
#import "WeSessionOutput.h"

@class WEChip;


@interface WESession : NSObject <WeSessionOutput>

//VIPER conectivity
@property (nonatomic,strong) id presentorDelegate;

@property (nonatomic,strong) WEChip * chipRed;
@property (nonatomic,strong) WEChip * chipBlue;
@property (nonatomic,strong) WEChip * chipWhite;
@property (nonatomic) WESessionStep step;

@end
