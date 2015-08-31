//
//  MatchesDesc.h
//  FutGol
//
//  Created by Diego Alejandro Cruz Ramirez on 30/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"

//Json modes
#define nGET                0
#define nPOST               1

extern NSMutableArray *mstLocalLogo;
extern NSMutableArray *mstLocalName;
extern NSMutableArray *mstLocalGoals;
extern NSMutableArray *mstForeignLogo;
extern NSMutableArray *mstForeignName;
extern NSMutableArray *mstForeignGoals;
extern NSMutableArray *mstNumbers;

@interface MatchesDesc : NSObject
+ (NSMutableArray *)getMatches;
@end
