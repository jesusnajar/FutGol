//
//  ParserNews.m
//  FutGol
//
//  Created by Diego Alejandro Cruz Ramirez on 30/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "ParserNews.h"

@implementation ParserNews

+ (void)parseNews:(NSMutableArray*)json {
    //check for valid value
    
    if(json != nil){
        for (int i=0; i < [json count]; i++) {
            NSString * team = [json objectAtIndex:i];
            NSData *data = [team dataUsingEncoding:NSUTF16StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            [mstNewsContent addObject:[json valueForKey: @"title"]];
            [mstNewsImg addObject:[json valueForKey: @"content"]];
            [mstNewsTitle addObject:[json valueForKey: @"photo"]];
        }
    }
}


@end
