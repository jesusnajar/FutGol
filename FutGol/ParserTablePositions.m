//
//  ParserTablePositions.m
//  FutGol
//
//  Created by Diego Alejandro Cruz Ramirez on 30/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "ParserTablePositions.h"

@implementation ParserTablePositions

+ (void)parseTablePositions:(NSMutableArray*)json {
    //check for valid value
    
    if(json != nil){
        for (int i=0; i < [json count]; i++) {
            NSString * team = [json objectAtIndex:i];
            NSData *data = [team dataUsingEncoding:NSUTF16StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            [mstTeamLogo addObject:[json valueForKey: @"team"]];
            [mstTeamName addObject:[json valueForKey: @"team_Name"]];
            [mstTeamGames addObject:[[json valueForKey: @"games"]stringValue]];
            [mstTeamPoints addObject:[[json valueForKey: @"points"]stringValue]];
            [mstTeamWons addObject:[[json valueForKey: @"won"]stringValue]];
            [mstTeamLost addObject:[[json valueForKey: @"lost"]stringValue]];
            [mstTeamDrawns addObject:[[json valueForKey: @"drawn"]stringValue]];
            [mstTeamGoalsFavor addObject:[[json valueForKey: @"favor"]stringValue]];
            [mstTeamGoalsAgainst addObject:[[json valueForKey: @"against"]stringValue]];
        }
    }
}

@end
