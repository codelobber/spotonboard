//
//  WeSessionOutput.h
//  CGI
//
//  Created by Zubov Ivan on 13/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//
#import "WEPlaydeckDefs.h"

@protocol WeSessionOutput

- (void) startNewSession;
- (NSArray *) chips;
- (WESessionStep) currrentStep;


@end
