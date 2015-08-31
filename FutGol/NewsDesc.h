//
//  NewsDesc.h
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

extern NSMutableArray *mstNewsImg;
extern NSMutableArray *mstNewsContent;
extern NSMutableArray *mstNewsTitle;

@interface NewsDesc : NSObject
+ (NSMutableArray *)getNews;
@end
