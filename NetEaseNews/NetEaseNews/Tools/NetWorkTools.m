//
//  NetWorkTools.m
//  NetEaseNews
//
//  Created by  justinchou on 16/5/2.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import "NetWorkTools.h"

@implementation NetWorkTools

+ (instancetype)sharedManager{
    
    static NetWorkTools *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *baseUrl = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        instance = [[self alloc] initWithBaseURL:baseUrl sessionConfiguration:config];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return instance;
}

@end
