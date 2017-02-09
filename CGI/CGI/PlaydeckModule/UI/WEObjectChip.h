//
//  WEObjectChip.h
//  CGI
//
//  Created by Zubov Ivan on 09/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface WEObjectChip : CALayer


typedef NS_ENUM(NSInteger, WEObjectChipType){
	WEObjectChipTypeNeutral=0,
	WEObjectChipTypeRed,
	WEObjectChipTypeBlue
};

typedef NS_ENUM(NSInteger, WEObjectChipOrientation){
	WEObjectChipOrientationVertical=0,
	WEObjectChipOrientationHorizontal
};


@property (nonatomic) WEObjectChipType chipType;
@property (nonatomic) WEObjectChipType orientation;

@end
