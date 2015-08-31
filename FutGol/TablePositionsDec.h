//
//  TablePositionsDec.h
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

extern NSMutableArray *mstTeamLogo;
extern NSMutableArray *mstTeamName;
extern NSMutableArray *mstTeamGames;
extern NSMutableArray *mstTeamPoints;
extern NSMutableArray *mstTeamWons;
extern NSMutableArray *mstTeamLost;
extern NSMutableArray *mstTeamDrawns;
extern NSMutableArray *mstTeamGoalsFavor;
extern NSMutableArray *mstTeamGoalsAgainst;

@interface TablePositionsDec : NSObject
+ (NSMutableArray *)getTablePositions;
@end
