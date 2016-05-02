//
//  News.h
//  NetEaseNews
//
//  Created by  justinchou on 16/5/2.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
/// 标题
@property (nonatomic, copy) NSString *title;
/// 摘要
@property (nonatomic, copy) NSString *digest;
/// 回复数
@property (nonatomic, assign) NSInteger replyCount;
/// 图片地址
@property (nonatomic, copy) NSString *imgSrc;

/// 字典转模型
///
/// @param dict 字典
///
/// @return 模型
+ (instancetype)newsWithDict:(NSDictionary *)dict;

/// 加载新闻列表
///
/// @param urlString url地址
/// @param finished  完成回调
+ (void)loadNewsListWithURLString:(NSString *)urlString finished:(void(^)(NSArray *newsList))finished;

@end
