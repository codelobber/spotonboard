//
//  WEmometr.m
//  CGI
//
//  Created by Zubov Ivan on 06/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import "WEmometr.h"
#import <QuartzCore/QuartzCore.h>

@implementation WEmometr

CALayer* _trackLayer;
CALayer* _knobLayer;

float _useableTrackLength;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
		_maximumValue = 10.0;
		_minimumValue = 0.0;
		_upperValue = 8.0;
		_lowerValue = 2.0;
		
		_trackLayer = [CALayer layer];
		_trackLayer.backgroundColor = [UIColor blueColor].CGColor;
		self.opaque = NO;
//		[self.layer addSublayer:_trackLayer];
		
		[self setLayerFrames];
	}
	return self;
}

- (void) setLayerFrames
{
	_trackLayer.frame = CGRectInset(self.bounds, 0, self.bounds.size.height / 3.5);
	
	
	[_trackLayer setNeedsDisplay];
 
//	_knobWidth = self.bounds.size.height;
	_useableTrackLength = self.bounds.size.width;
  
}


-(void)drawRect:(CGRect)rect{
	
	[super drawRect:rect];
	
	float radius = CGRectGetHeight(rect)/2-1;
	const int TB_BACKGROUND_WIDTH = 60;
	const int TB_LINE_WIDTH = 40;
	const int TB_SLIDER_SIZE = CGRectGetHeight(rect)+TB_BACKGROUND_WIDTH;
	

	CGContextRef ctx = UIGraphicsGetCurrentContext();
	
	/** Draw the Background **/
	
	//Create the path
	CGContextAddArc(ctx, TB_SLIDER_SIZE/2, TB_SLIDER_SIZE/2, radius, 0, M_PI *2, 0);
	
	//Set the stroke color to black
	[[UIColor blackColor]setStroke];
	
	//Define line width and cap
	CGContextSetLineWidth(ctx, TB_BACKGROUND_WIDTH);
	CGContextSetLineCap(ctx, kCGLineCapButt);
	
	//draw it!
	CGContextDrawPath(ctx, kCGPathStroke);
	
	
	//** Draw the circle (using a clipped gradient) **/
	
	
	/** Create THE MASK Image **/
//	UIGraphicsBeginImageContext(CGSizeMake(TB_SLIDER_SIZE,TB_SLIDER_SIZE));
	UIGraphicsBeginImageContext(CGSizeMake(CGRectGetWidth(rect),CGRectGetHeight(rect)));
	CGContextRef imageCtx = UIGraphicsGetCurrentContext();
	
	CGContextAddArc(imageCtx, CGRectGetWidth(rect)/2  , TB_SLIDER_SIZE/2, radius, 0, M_PI*2, 0);
	[[UIColor redColor]set];
	
	//Use shadow to create the Blur effect
	CGContextSetShadowWithColor(imageCtx, CGSizeMake(0, 0), 90/20, [UIColor blackColor].CGColor);
	
	//define the path
	CGContextSetLineWidth(imageCtx, TB_LINE_WIDTH);
	CGContextDrawPath(imageCtx, kCGPathStroke);
	
	//save the context content into the image mask
	CGImageRef mask = CGBitmapContextCreateImage(UIGraphicsGetCurrentContext());
	UIGraphicsEndImageContext();
	
	
	
	/** Clip Context to the mask **/
	CGContextSaveGState(ctx);
	
	CGContextClipToMask(ctx, rect, mask);
	CGImageRelease(mask);
	
	
	
	/** THE GRADIENT **/
	
	//list of components
	CGFloat components[8] = {
		0.0, 0.0, 1.0, 1.0,     // Start color - Blue
		1.0, 0.0, 1.0, 1.0 };   // End color - Violet
	
	CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
	CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, components, NULL, 2);
	CGColorSpaceRelease(baseSpace), baseSpace = NULL;
	
	//Gradient direction
	CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
	CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
	
	//Draw the gradient
	CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, 0);
	CGGradientRelease(gradient), gradient = NULL;
	
	CGContextRestoreGState(ctx);
	
	
	/** Add some light reflection effects on the background circle**/
	
	CGContextSetLineWidth(ctx, 1);
	CGContextSetLineCap(ctx, kCGLineCapRound);
	
	//Draw the outside light
	CGContextBeginPath(ctx);
	CGContextAddArc(ctx, TB_SLIDER_SIZE/2  , TB_SLIDER_SIZE/2, radius+TB_BACKGROUND_WIDTH/2, 0, M_PI*2, 1);
	[[UIColor colorWithWhite:1.0 alpha:0.05]set];
	CGContextDrawPath(ctx, kCGPathStroke);
	
	//draw the inner light
	CGContextBeginPath(ctx);
	CGContextAddArc(ctx, TB_SLIDER_SIZE/2  , TB_SLIDER_SIZE/2, radius-TB_BACKGROUND_WIDTH/2, 0, M_PI*2, 1);
	[[UIColor colorWithWhite:1.0 alpha:0.05]set];
	CGContextDrawPath(ctx, kCGPathStroke);
	
	
	/** Draw the handle **/
	//[self drawTheHandle:ctx];
	
}

@end
