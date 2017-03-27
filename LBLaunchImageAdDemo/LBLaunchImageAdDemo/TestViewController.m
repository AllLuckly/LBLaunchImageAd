//
//  TestViewController.m
//  LBLaunchImageAd
//  技术交流群：534926022（免费） 511040024(0.8/人付费)
//  Created by gold on 16/6/12.
//  Copyright © 2016年 Bison. All rights reserved.
//  iOS开发学习app下载https://itunes.apple.com/cn/app/it-blog-for-ios-developers/id1067787090?mt=8

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //https://itunes.apple.com/cn/app/it-blog-for-ios-developers/id1067787090?mt=8
    NSURL *url = [NSURL URLWithString:@"https://github.com/AllLuckly/LBLaunchImageAd"];
    [[UIApplication sharedApplication] openURL:url];
}


@end
