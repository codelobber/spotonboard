//
//  WePlaydeckVCdelegate.h
//  CGI
//
//  Created by Zubov Ivan on 08/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//
#import "WEObjectChip.h"

@protocol WEPlaydeckVCDelegate

//View interface
-(void) initDesk;
-(void) moveChipWithType:(WEObjectChipType) chipType toPos:(CGRect) pos animated:(BOOL) animated;

@end
