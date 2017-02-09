//
//  WEDeskView.m
//  CGI
//
//  Created by Zubov Ivan on 09/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import "WEDeskView.h"

@implementation WEDeskView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self initializeDesk];
	}
	return self;
}

-(void) initializeDesk{
	float chipw = (CGRectGetWidth(self.frame)/3)*0.8;
	float chipdx = (CGRectGetWidth(self.frame)/3)*0.1;
	float chiph = 2*(CGRectGetHeight(self.frame)/3)-chipdx*2;
	float chipdy = chipdx;
	
	self.desk = [WEObjectDesk layer];
	[self.layer addSublayer:self.desk];
	
	self.desk.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame),CGRectGetHeight(self.frame));
	[self.desk setNeedsDisplay];

	self.chip = [WEObjectChip layer];
	[self.layer addSublayer:self.chip];
	
//	self.chip.frame = CGRectMake(2.5+chipdx, 2.5+chipdy, chipw,chiph);
	self.chip.frame = CGRectMake(2.5+chipdx, 2.5+chipdy, chiph,chipw);
	self.chip.orientation = WEObjectChipOrientationHorizontal;
	[self.chip setNeedsDisplay];

	WEObjectChip *chip2 = [WEObjectChip layer];
	[self.layer addSublayer:chip2];
	
	chip2.frame = CGRectMake(chipdx+2*(CGRectGetWidth(self.frame)/3), 2.5+chipdy, chipw,chiph);
	chip2.orientation = WEObjectChipOrientationVertical;
	[chip2 setNeedsDisplay];
	
}

@end
