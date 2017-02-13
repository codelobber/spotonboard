//
//  WESession.m
//  CGI
//
//  Created by Zubov Ivan on 13/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import "WESession.h"
#import "WEChip.h"

@implementation WESession


-(void) startNewSession{
	self.chipBlue = [WEChip new];
	self.chipWhite = [WEChip new];
	self.chipRed = [WEChip new];
	
	self.chipBlue.type = WEObjectChipTypeBlue;
	self.chipWhite.type = WEObjectChipTypeNeutral;
	self.chipRed.type = WEObjectChipTypeRed;

	self.chipBlue.position = CGRectMake(1, 2, 1, 3);
	self.chipWhite.position = CGRectMake(2, 2, 2, 3);
	self.chipRed.position = CGRectMake(3, 2, 3, 3);
}

- (NSArray *) chips{
	return @[self.chipBlue,self.chipWhite,self.chipRed];
}

- (WESessionStep) currrentStep{
	return self.step;
}


@end
