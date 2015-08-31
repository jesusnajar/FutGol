//
//  ParserTableGoals.m
//  FutGol
//
//  Created by Diego Alejandro Cruz Ramirez on 30/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "ParserTableGoals.h"

@implementation ParserTableGoals

+ (void)parseTableGoals:(NSMutableArray*)json {
    //check for valid value
    
    if(json != nil){
        for (int i=0; i < [json count]; i++) {
            NSString * player = [json objectAtIndex:i];
            NSData *data = [player dataUsingEncoding:NSUTF16StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            [mstPlayerPhoto addObject:[json valueForKey: @"photo"]];
            [mstPlayerName addObject:[json valueForKey: @"name"]];
            [mstPlayerTeam addObject:[json valueForKey: @"team"]];
            [mstPlayerGoals addObject:[[json valueForKey: @"goals"]stringValue]];
        }
    }
}
@end
