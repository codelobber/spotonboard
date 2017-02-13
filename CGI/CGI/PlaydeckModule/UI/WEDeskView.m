//
//  WEDeskView.m
//  CGI
//
//  Created by Zubov Ivan on 09/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import "WEDeskView.h"

@interface WEDeskView()

@property (nonatomic) CGSize deskSize;
@property (nonatomic) CGSize cellSize;
@property (nonatomic) CGFloat deskBorderWidth;

@end

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
	self.deskBorderWidth = CGRectGetWidth(self.frame)/20;
	self.deskSize = CGSizeMake(CGRectGetWidth(self.frame)-2*self.deskBorderWidth,CGRectGetHeight(self.frame)-2*self.deskBorderWidth);
	self.cellSize = CGSizeMake(self.deskSize.width/3,self.deskSize.height/3);
	
	
	// create desk
	self.desk = [WEObjectDesk layer];
	[self.layer addSublayer:self.desk];
	
	
	self.desk.frame = CGRectMake(0, 0, self.deskSize.width+2*self.deskBorderWidth, self.deskSize.height+2*self.deskBorderWidth);
	self.desk.deskBorderWidth = self.deskBorderWidth;
	
	[self.desk setNeedsDisplay];

	// create chips
	self.chipWhite = [WEObjectChip layer];
	self.chipWhite.chipType = WEObjectChipTypeNeutral;
	[self.layer addSublayer:self.chipWhite];
	
	self.chipRed = [WEObjectChip layer];
	self.chipRed.chipType = WEObjectChipTypeRed;
//	[self.layer addSublayer:self.chipRed];
	
	self.chipBlue = [WEObjectChip layer];
	self.chipBlue.chipType = WEObjectChipTypeBlue;
//	[self.layer addSublayer:self.chipBlue];
	
}

-(void) moveChip:(WEObjectChip *) chip toPos:(CGRect) pos{
	chip.orientation = (CGRectGetMinX(pos)==CGRectGetWidth(pos))?WEObjectChipOrientationVertical:WEObjectChipOrientationHorizontal;
	float chipdy = (self.cellSize.height-self.cellSize.width*0.8)/2;
	float chipdx = (self.cellSize.width-self.cellSize.height*0.8)/2;
	float chipw = self.cellSize.width-chipdy*2;
	float chiph = self.cellSize.height-chipdy*2;

	switch (chip.orientation) {
		case WEObjectChipOrientationHorizontal:
			chipw += self.cellSize.width;
			break;
		case WEObjectChipOrientationVertical:
		default:
			chiph += self.cellSize.height;
			break;
	}
	
	float chipx = self.deskBorderWidth+(CGRectGetMinX(pos)-1)*self.cellSize.width+chipdx;
	float chipy = self.deskBorderWidth+(CGRectGetMinY(pos)-1)*self.cellSize.height+chipdy;
	
	chip.frame = CGRectMake(chipx, chipy, chipw, chiph);
	
	[self.layer addSublayer:chip];
	[chip setNeedsDisplay];
}

-(void) moveChipWithType:(WEObjectChipType) chipType toPos:(CGRect) pos{
	WEObjectChip *chip;
	switch (chipType) {
		case WEObjectChipTypeRed:
			chip = self.chipRed;
			break;
		case WEObjectChipTypeBlue:
			chip = self.chipBlue;
			break;
		case WEObjectChipTypeNeutral:
			chip = self.chipWhite;
			break;
	}
	if(chip) [self moveChip:chip toPos:pos];
}

@end
