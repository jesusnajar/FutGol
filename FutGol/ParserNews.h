//
//  ParserNews.h
//  FutGol
//
//  Created by Diego Alejandro Cruz Ramirez on 30/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDesc.h"

@interface ParserNews : NSObject
+ (void)parseNews:(NSMutableArray*)json;
@end
