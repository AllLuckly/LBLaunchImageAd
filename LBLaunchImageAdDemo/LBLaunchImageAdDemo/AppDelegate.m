//
//  AppDelegate.m
//  LBLaunchImageAdDemo
//
//  技术交流群：534926022（免费） 511040024(0.8/人付费)
//  Created by gold on 16/6/12.
//  Copyright © 2016年 Bison. All rights reserved.
//  iOS开发学习app下载https://itunes.apple.com/cn/app/it-blog-for-ios-developers/id1067787090?mt=8

#import "AppDelegate.h"
#import "TestViewController.h"
#import "NSObject+LBLaunchImage.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /* 
     * FullScreenAdType 全屏广告
     * LogoAdType 带logo的广告类似网易广告，值得注意的是启动图片必须带logo图
     * imgUrl  图片url
     */
    
   
//    ///在确认url有值后写，否则会出现突然白一下的情况
//    adView.imgUrl = @"http://www.uisheji.com/wp-content/uploads/2013/04/19/app-design-uisheji-ui-icon20121_55.jpg";
    
    
    /* FullScreenAdType 全屏广告
     * LogoAdType 带logo的广告类似网易广告，值得注意的是启动图片必须带logo图
     * localAdImgName  本地图片名字
     */
    __weak typeof(self) weakSelf = self;
    [NSObject makeLBLaunchImageAdView:^(LBLaunchImageAdView *imgAdView) {
        //设置广告的类型
        imgAdView.getLBlaunchImageAdViewType(LogoAdType);
        //设置本地启动图片
        imgAdView.localAdImgName = @"qidong.gif";
        //自定义跳过按钮
        imgAdView.skipBtn.backgroundColor = [UIColor blackColor];
        //各种点击事件的回调
        imgAdView.clickBlock = ^(clickType type){
            switch (type) {
                case clickAdType:{
                    NSLog(@"点击广告回调");
                    TestViewController *vc = [[TestViewController alloc]init];
                    vc.view.backgroundColor = [UIColor whiteColor];
                    [weakSelf.window.rootViewController presentViewController:vc animated:YES completion:^{

                    }];
                }
                    break;
                case skipAdType:
                    NSLog(@"点击跳过回调");
                    break;
                case overtimeAdType:
                    NSLog(@"倒计时完成后的回调");
                    break;
                default:
                    break;
            }
        };
       
    }];
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
