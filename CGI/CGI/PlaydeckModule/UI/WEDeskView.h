//
//  WEDeskView.h
//  CGI
//
//  Created by Zubov Ivan on 09/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WEObjectDesk.h"
#import "WEObjectChip.h"

@interface WEDeskView : UIView

@property (nonatomic,strong) WEObjectDesk *desk;
@property (nonatomic,strong) WEObjectChip *chip;

-(void) initializeDesk;

@end
