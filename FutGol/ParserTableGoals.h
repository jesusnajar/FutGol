//
//  ParserTableGoals.h
//  FutGol
//
//  Created by Diego Alejandro Cruz Ramirez on 30/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableGoalsDec.h"

@interface ParserTableGoals : NSObject
+ (void)parseTableGoals:(NSMutableArray*)json;
@end
