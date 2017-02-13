//
//  Header.h
//  CGI
//
//  Created by Zubov Ivan on 13/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#ifndef weplaydeckdefs_h
#define weplaydeckdefs_h

typedef NS_ENUM(NSInteger, WEObjectChipType){
	WEObjectChipTypeNeutral=0,
	WEObjectChipTypeRed,
	WEObjectChipTypeBlue
};

typedef NS_ENUM(NSInteger, WEObjectChipOrientation){
	WEObjectChipOrientationVertical=0,
	WEObjectChipOrientationHorizontal
};

typedef NS_ENUM(NSInteger, WESessionStep){
	WESessionStepPrepare=0,
	WESessionStepMoveColor,
	WESessionStepMoveWhite,
	WESessionStepEndingTurn,
	WESessionStepEndingGame
};

#endif
