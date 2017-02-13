//
//  WEObjectChip.m
//  CGI
//
//  Created by Zubov Ivan on 09/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import "WEObjectChip.h"
#import <uikit/UIColor.h>
#import <UIKit/UIBezierPath.h>

@interface WEObjectChip ()

@property (nonatomic) UIColor *bgLightcolor;
@property (nonatomic,strong) UIColor *bgDarkcolor;
@property (nonatomic,strong) UIColor *borderLightcolor;
@property (nonatomic,strong) UIColor *borderDarkcolor;

@end


@implementation WEObjectChip

-(void) setChipType:(WEObjectChipType)chipType{
	_chipType = chipType;
	switch (chipType) {
		case WEObjectChipTypeRed:
			self.bgLightcolor =		[UIColor colorWithRed:0.9 green:0.3 blue:0.3 alpha:1.0];
			self.bgDarkcolor =		[UIColor colorWithRed:0.6 green:0.1 blue:0.1 alpha:1.0];
			self.borderLightcolor =	[UIColor colorWithRed:1.0 green:0.6 blue:0.6 alpha:1.0];
			self.borderDarkcolor =	[UIColor colorWithRed:0.4 green:0.0 blue:0.0 alpha:1.0];
			break;
		case WEObjectChipTypeBlue:
			self.bgLightcolor =		[UIColor colorWithRed:0.3 green:0.3 blue:0.9 alpha:1.0];
			self.bgDarkcolor =		[UIColor colorWithRed:0.1 green:0.1 blue:0.6 alpha:1.0];
			self.borderLightcolor =	[UIColor colorWithRed:0.6 green:0.6 blue:1.0 alpha:1.0];
			self.borderDarkcolor =	[UIColor colorWithRed:0.0 green:0.0 blue:0.4 alpha:1.0];
			break;
		case WEObjectChipTypeNeutral:
		default:
			self.bgLightcolor =		[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
			self.bgDarkcolor =		[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
			self.borderLightcolor =	[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
			self.borderDarkcolor =	[UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.0];
			break;
	}
}

-(void) drawInContext:(CGContextRef)ctx{
	CGRect chipFrame = CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMinY(self.bounds), CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
	
	float defaultborder = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))/20;
	
	const float roundRadius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))/10;
	const float borderWidthH = self.orientation==WEObjectChipOrientationVertical?defaultborder*2:defaultborder;
	const float borderWidthW = self.orientation==WEObjectChipOrientationVertical?defaultborder:defaultborder*2;
	
	UIBezierPath *chipPath = [UIBezierPath bezierPathWithRoundedRect:chipFrame cornerRadius:roundRadius];
	UIBezierPath *chipSubPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(chipFrame,borderWidthW,borderWidthH) cornerRadius:roundRadius];
 
	// 1) fill outter bg
	CGGradientRef myGradient;
	CGColorSpaceRef myColorspace;
	CGFloat locations1[2] = { 0.0, 1.0 };
 
	myColorspace = CGColorSpaceCreateDeviceRGB();
	myGradient = CGGradientCreateWithColors(myColorspace, (CFArrayRef)@[(id)self.borderLightcolor.CGColor,(id)self.borderDarkcolor.CGColor], locations1);
 
	CGPoint startPoint = CGPointMake(CGRectGetMidX(chipFrame), CGRectGetMinY(chipFrame));
	CGPoint endPoint = CGPointMake(CGRectGetMidX(chipFrame), CGRectGetMaxY(chipFrame));
 
	CGContextSaveGState(ctx);
	CGContextAddPath(ctx, chipPath.CGPath);
	CGContextClip(ctx);
	CGContextDrawLinearGradient(ctx, myGradient, startPoint, endPoint, 0);
 
	// 2) fill inner bg
	CGGradientRelease(myGradient);
	CGColorSpaceRelease(myColorspace);
	CGContextRestoreGState(ctx);
	
	CGFloat locations[2] = { 0.0, 1.0 };
	CGContextSetShadowWithColor(ctx, CGSizeMake(0, 1), 10.0, self.bgLightcolor.CGColor);
 
	myColorspace = CGColorSpaceCreateDeviceRGB();
	myGradient = CGGradientCreateWithColors(myColorspace, (CFArrayRef)@[(id)self.bgLightcolor.CGColor,(id)self.bgDarkcolor.CGColor], locations);
 
	startPoint = CGPointMake(CGRectGetMidX(chipFrame), CGRectGetMinY(chipFrame));
	endPoint = CGPointMake(CGRectGetMidX(chipFrame), CGRectGetMaxY(chipFrame));
 
	CGContextSaveGState(ctx);
	CGContextAddPath(ctx, chipSubPath.CGPath);
	CGContextClip(ctx);
	CGContextDrawLinearGradient(ctx, myGradient, startPoint, endPoint, 0);
 
	CGGradientRelease(myGradient);
	CGColorSpaceRelease(myColorspace);
	CGContextRestoreGState(ctx);
		
 
	// 3) outline
	CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), 0.0, self.borderLightcolor.CGColor);
	
	CGContextSetStrokeColorWithColor(ctx, self.borderLightcolor.CGColor);
	CGContextSetLineWidth(ctx, 0.5);
	CGContextAddPath(ctx, chipSubPath.CGPath);
	
	CGContextStrokePath(ctx);
	
}

@end
