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

@implementation WEObjectChip

-(void) drawInContext:(CGContextRef)ctx{
	CGRect chipFrame = CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMinY(self.bounds), CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
	
	float defaultborder = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))/20;
	
	const float roundRadius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))/10;
	const float borderWidthH = self.orientation==WEObjectChipOrientationVertical?defaultborder*2:defaultborder;
	const float borderWidthW = self.orientation==WEObjectChipOrientationVertical?defaultborder:defaultborder*2;
	
	UIColor *bgcolor = [UIColor colorWithRed:0.9 green:0.3 blue:0.3 alpha:1.0];
	UIColor *darkcolor = [UIColor colorWithRed:0.6 green:0.1 blue:0.1 alpha:1.0];
	UIColor *lightcolor = [UIColor colorWithRed:1.0 green:0.6 blue:0.6 alpha:1.0];
	UIColor *lightcolor2 = [UIColor colorWithRed:0.4 green:0 blue:0 alpha:1.0];
 
	UIBezierPath *chipPath = [UIBezierPath bezierPathWithRoundedRect:chipFrame cornerRadius:roundRadius];
//	UIBezierPath *chipPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(chipFrame,borderWidth,borderWidth)  cornerRadius:roundRadius];
	UIBezierPath *chipSubPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(chipFrame,borderWidthW,borderWidthH) cornerRadius:roundRadius];
 
	// 1) fill bg

	CGGradientRef myGradient;
	CGColorSpaceRef myColorspace;
	CGFloat locations1[2] = { 0.0, 1.0 };
 
	myColorspace = CGColorSpaceCreateDeviceRGB();
	myGradient = CGGradientCreateWithColors(myColorspace, (CFArrayRef)@[(id)lightcolor.CGColor,(id)lightcolor2.CGColor], locations1);
 
	CGPoint startPoint = CGPointMake(CGRectGetMidX(chipFrame), CGRectGetMinY(chipFrame));
	CGPoint endPoint = CGPointMake(CGRectGetMidX(chipFrame), CGRectGetMaxY(chipFrame));
 
	CGContextSaveGState(ctx);
	CGContextAddPath(ctx, chipPath.CGPath);
	CGContextClip(ctx);
	CGContextDrawLinearGradient(ctx, myGradient, startPoint, endPoint, 0);
 
	CGGradientRelease(myGradient);
	CGColorSpaceRelease(myColorspace);
	CGContextRestoreGState(ctx);
	
	
//	CGGradientRef myGradient;
//	CGColorSpaceRef myColorspace;
	CGFloat locations[2] = { 0.5, 1.0 };
	CGContextSetShadowWithColor(ctx, CGSizeMake(0, 1), 10.0, bgcolor.CGColor);
 
	myColorspace = CGColorSpaceCreateDeviceRGB();
	myGradient = CGGradientCreateWithColors(myColorspace, (CFArrayRef)@[(id)bgcolor.CGColor,(id)darkcolor.CGColor], locations);
 
//	CGPoint startPoint = CGPointMake(CGRectGetMidX(chipFrame), CGRectGetMinY(chipFrame));
//	CGPoint endPoint = CGPointMake(CGRectGetMidX(chipFrame), CGRectGetMaxY(chipFrame));
	startPoint = CGPointMake(CGRectGetMidX(chipFrame), CGRectGetMinY(chipFrame));
	endPoint = CGPointMake(CGRectGetMidX(chipFrame), CGRectGetMaxY(chipFrame));
 
	CGContextSaveGState(ctx);
	CGContextAddPath(ctx, chipSubPath.CGPath);
	CGContextClip(ctx);
	CGContextDrawLinearGradient(ctx, myGradient, startPoint, endPoint, 0);
 
	CGGradientRelease(myGradient);
	CGColorSpaceRelease(myColorspace);
	CGContextRestoreGState(ctx);
		
 
	// 2) outline
	
	CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), 0.0, lightcolor.CGColor);
	
	CGContextSetStrokeColorWithColor(ctx, lightcolor.CGColor);
	CGContextSetLineWidth(ctx, 0.5);
	CGContextAddPath(ctx, chipSubPath.CGPath);
	
	CGContextStrokePath(ctx);
	
}

@end
