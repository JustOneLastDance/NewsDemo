//
//  News.m
//  NetEaseNews
//
//  Created by  justinchou on 16/5/2.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import "News.h"
#import "NetWorkTools.h"
#import <objc/runtime.h>



@implementation News

+ (instancetype)newsWithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc] init];
    
    NSArray *properties = [self properties];
    
    for (NSString *key in properties) {
        if (dict[key] != nil) {
            [obj setValue:dict[key] forKey:key];
        }
    }
    
    return obj;
}

+ (NSArray *)properties{
    NSArray *arr = @[@"title", @"digest", @"replyCount", @"imgSrc"];
    return arr;
}

- (NSString *)description{
    NSDictionary *dict = [self dictionaryWithValuesForKeys:[News properties]];
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}

#pragma mark - 网络请求逻辑
+ (void)loadNewsListWithURLString:(NSString *)urlString finished:(void (^)(NSArray *))finished{
    
    NSAssert(finished, @"必须传入完成回调");
    
    [[NetWorkTools sharedManager] GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        NSDictionary *result = responseObject;
        NSArray *arr = result[result.keyEnumerator.nextObject];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [arrM addObject:[self newsWithDict:obj]];
        }];
        
        finished(arrM.copy);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error != nil) {
            NSLog(@"%@", error);
        }
    }];
    
}

@end
