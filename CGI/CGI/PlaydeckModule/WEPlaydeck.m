//
//  WEPlaydeck.m
//  CGI
//
//  Created by Zubov Ivan on 08/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import "WEPlaydeck.h"
#import "WEChip.h"
#import "WEPlaydeckDefs.h"

@implementation WEPlaydeck

#pragma mark - Presentor delegate

- (void) viewReady{
	NSLog(@"Hello world");
	[self.viewDelegate initDesk];
	[self.interactorDelegate startNewSession];
	[self updateSession];
//	[self.viewDelegate moveChipWithType:WEObjectChipTypeBlue toPos:CGRectMake(1, 3, 2, 3) animated:NO];
}

- (void) updateSession{
	
	
	
	
	
	[self updateDeck];
}

- (void) updateDeck{
	NSArray * chipsList = self.interactorDelegate.chips;
	
	for (WEChip * chip in chipsList) {
		[self.viewDelegate moveChipWithType:chip.type toPos:chip.position animated:NO];
	}
}


@end
