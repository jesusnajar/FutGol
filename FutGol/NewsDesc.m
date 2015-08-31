//
//  NewsDesc.m
//  FutGol
//
//  Created by Diego Alejandro Cruz Ramirez on 30/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "NewsDesc.h"
#define nURLNews     @"http://futgol.x10host.com/Futgol/Endpoints/Get_All_News.php"

NSMutableArray *mstNewsImg;
NSMutableArray *mstNewsContent;
NSMutableArray *mstNewsTitle;

@implementation NewsDesc
/**********************************************************************************************/
#pragma mark - Particular methods
/**********************************************************************************************/
+ (NSMutableArray *)getNews {
    NSMutableDictionary *diData = [[NSMutableDictionary alloc]init];
    //add post to dictionary
    NSString  *stData           = [diData JSONRepresentation];
    
    NSString *stNewURL          = nURLNews;
    
    return [self sendRequest:stNewURL forData:stData andMode:nGET];
}
/**********************************************************************************************/
#pragma mark - json common method
/**********************************************************************************************/
+ (NSMutableArray *) sendRequest:(NSString *) postUrl forData:(NSString *) data andMode:(BOOL)mode {
    @try {
        NSString *post;
        if (mode) {
            post = [[NSString alloc] initWithFormat:@"data=%@", data];
        }
        else {
            post = [[NSString alloc] initWithFormat:@""];
        }
        NSLog(@"post parameters: %@",post);
        post = [post stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
        NSURL *url = [NSURL URLWithString:postUrl];
        NSLog(@"URL post = %@", url);
        NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        if (mode) {
            [request setHTTPMethod:@"POST"];
        }
        else {
            [request setHTTPMethod:@"GET"];
        }
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"iOS QC 1.0" forHTTPHeaderField:@"User-Agent"];
        [request setHTTPBody:postData];
        [NSURLRequest requestWithURL:url];
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        //Check response
        if ([response statusCode] >=200 && [response statusCode] <300) {
            //get json response
            NSMutableArray *jsonResponse = [NSJSONSerialization JSONObjectWithData: urlData options:        NSJSONReadingMutableContainers error: &error];
            //NSLog(@"response received %@",jsonResponse);
            return jsonResponse;
        }
        else { if (error) {NSLog(@"Error response"); return nil; } else {NSLog(@"Conect Fail");return nil;}
            return nil;
        }
    }
    @catch (NSException * e) {NSLog(@"Exception"); return nil;}
}

@end
