//
//  NetWorkTools.h
//  NetEaseNews
//
//  Created by  justinchou on 16/5/2.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetWorkTools : AFHTTPSessionManager
/// 网络工具单例
///
/// @return 网络工具
+ (instancetype)sharedManager;

@end
