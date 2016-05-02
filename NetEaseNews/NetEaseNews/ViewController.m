//
//  ViewController.m
//  NetEaseNews
//
//  Created by  justinchou on 16/3/20.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import "ViewController.h"
#import "News.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [News loadNewsListWithURLString:@"T1348647853363/0-20.html" finished:^(NSArray *newsList) {
//        NSLog(@"%@", newsList);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
