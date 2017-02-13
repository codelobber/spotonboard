//
//  WEObjectDesk.m
//  CGI
//
//  Created by Zubov Ivan on 09/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import "WEObjectDesk.h"
#import <uikit/UIColor.h>
#import <UIKit/UIBezierPath.h>

@interface WEObjectDesk()

@end

@implementation WEObjectDesk


-(void) setDeskBorderWidth:(CGFloat)borderWidth{
	_deskBorderWidth = borderWidth;
}

-(void) drawInContext:(CGContextRef)ctx{
	CGRect deckFrame = CGRectInset(self.frame, self.deskBorderWidth, self.deskBorderWidth);
	CGRect borderFrame = CGRectInset(self.frame, self.deskBorderWidth/2, self.deskBorderWidth/2);
	
	const float rowx = CGRectGetMinX(deckFrame);
	const float coly = CGRectGetMinY(deckFrame);
	const float rowh = CGRectGetHeight(deckFrame)/3;
	const float colw = CGRectGetWidth(deckFrame)/3;
	
	UIColor *bordercolor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
	UIColor *linescolor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
	UIColor *bgcolor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
	UIColor *firstRowbgcolor = [UIColor colorWithRed:0.8 green:1.0 blue:0.8 alpha:1.0];
 
	UIBezierPath *deckPath = [UIBezierPath bezierPathWithRect:deckFrame];
	UIBezierPath *borderPath = [UIBezierPath bezierPathWithRect:borderFrame];
 
	// 1) fill bg
	CGContextSetFillColorWithColor(ctx, bgcolor.CGColor);
	CGContextAddPath(ctx, deckPath.CGPath);
	CGContextFillPath(ctx);
	
	CGRect firstRowRect = CGRectMake(rowx, coly, CGRectGetWidth(deckFrame), rowh);
	UIBezierPath *firstRowPath = [UIBezierPath bezierPathWithRect:firstRowRect];
	CGContextSetFillColorWithColor(ctx, firstRowbgcolor.CGColor);
	CGContextAddPath(ctx, firstRowPath.CGPath);
	CGContextFillPath(ctx);

	
 
	// 2) outline
	CGContextSetShadowWithColor(ctx, CGSizeMake(0, 1), 20.0, [UIColor grayColor].CGColor);
	
	CGContextSetStrokeColorWithColor(ctx, linescolor.CGColor);
	CGContextSetLineWidth(ctx, 1);
									 
	for (int i=0;i<3;i++){
		CGRect rowRect = CGRectMake(rowx, coly+i*rowh, CGRectGetWidth(deckFrame), rowh);
		CGRect colRect = CGRectMake(i*colw+rowx, coly, colw, CGRectGetHeight(deckFrame));
		
		UIBezierPath *rowPath = [UIBezierPath bezierPathWithRect:rowRect];
		UIBezierPath *colPath = [UIBezierPath bezierPathWithRect:colRect];

		CGContextAddPath(ctx, rowPath.CGPath);
		CGContextAddPath(ctx, colPath.CGPath);
	}

	CGContextStrokePath(ctx);
	
	// 3) frame
	
	CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), 0.0, [UIColor blackColor].CGColor);
	
	CGContextSetStrokeColorWithColor(ctx, bordercolor.CGColor);
	CGContextSetLineWidth(ctx, self.borderWidth);
	CGContextAddPath(ctx, borderPath.CGPath);
	
	CGContextStrokePath(ctx);
	
}

@end
