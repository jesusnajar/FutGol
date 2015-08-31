//
//  ParserMatches.m
//  FutGol
//
//  Created by Diego Alejandro Cruz Ramirez on 30/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "ParserMatches.h"

@implementation ParserMatches

+ (void)parseMatches:(NSMutableArray*)json {
    //check for valid value
    
    if(json != nil){
        for (int i=0; i < [json count]; i++) {
            NSString * team = [json objectAtIndex:i];
            NSData *data = [team dataUsingEncoding:NSUTF8StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            [mstNumbers addObject:[json valueForKey: @"number" ]];
            [mstLocalName addObject:[json valueForKey: @"local_Team"]];
            [mstLocalLogo addObject:[json valueForKey: @"local_Logo"]];
            [mstLocalGoals addObject:[json valueForKey: @"local_Goals"]];
            [mstForeignLogo addObject:[json valueForKey: @"foreign_Logo"]];
            [mstForeignName addObject:[json valueForKey: @"foreign_Team"]];
            [mstForeignGoals addObject:[json valueForKey: @"foreign_Goals"]];
        }
    }
}

@end
