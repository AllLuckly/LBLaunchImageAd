//  好用请star：https://github.com/AllLuckly/LBLaunchImageAd
//  LBLaunchImageAdView.h
//  LBLaunchImageAd
//  技术交流群：534926022（免费） 511040024(0.8元/人付费)
//  Created by gold on 16/6/8.
//  Copyright © 2016年 Bison. All rights reserved.
//  iOS开发学习app下载https://itunes.apple.com/cn/app/it-blog-for-ios-developers/id1067787090?mt=8

typedef enum {
    
    LogoAdType = 0,///带logo的广告
    FullScreenAdType = 1,///全屏的广告
    
}AdType;

typedef enum {
    
    skipAdType = 1,///点击跳过
    clickAdType = 2,///点击广告
    overtimeAdType = 3,///倒计时完成跳过
    
}clickType;

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

typedef void (^LBClick) (const clickType);


@interface LBLaunchImageAdView : UIView

@property (nonatomic, strong) UIImageView *aDImgView;
///倒计时总时长,默认6秒
@property (nonatomic, assign) NSInteger adTime;
///跳过按钮 可自定义
@property (nonatomic, strong) UIButton *skipBtn;
///本地图片名字
@property (nonatomic, copy) NSString *localAdImgName;
///网络图片URL
@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, copy)LBClick clickBlock;

/*
 *  adType 广告类型
 */
- (void(^)(AdType const adType))getLBlaunchImageAdViewType;

@end
