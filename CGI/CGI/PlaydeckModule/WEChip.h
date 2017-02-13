//
//  WEChip.h
//  CGI
//
//  Created by Zubov Ivan on 13/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "WEPlaydeckDefs.h"

@interface WEChip : NSObject

@property (nonatomic) WEObjectChipType type;
@property (nonatomic) CGRect position;

@end
