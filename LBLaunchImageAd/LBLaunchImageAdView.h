//
//  LBLaunchImageAdView.h
//  LBLaunchImageAd
//  技术交流群：534926022（免费） 511040024(0.8/人付费)
//  Created by gold on 16/6/8.
//  Copyright © 2016年 Bison. All rights reserved.
//  iOS开发学习app下载https://itunes.apple.com/cn/app/it-blog-for-ios-developers/id1067787090?mt=8

typedef enum {
    
    FullScreenAdType = 1,//全屏的广告
    LogoAdType = 0,//带logo的广告
    
}AdType;


#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

#define mainHeight      [[UIScreen mainScreen] bounds].size.height
#define mainWidth       [[UIScreen mainScreen] bounds].size.width

typedef void (^LBClick) (NSInteger tag);
@interface LBLaunchImageAdView : UIView

@property (strong, nonatomic) UIImageView *aDImgView;
@property (strong, nonatomic) UIWindow *window;
@property (assign, nonatomic) NSInteger adTime; //倒计时总时长,默认6秒
@property (strong, nonatomic) UIButton *skipBtn;
@property (nonatomic, copy)LBClick clickBlock;

- (instancetype)initWithWindow:(UIWindow *)window andType:(NSInteger)type andImgUrl:(NSString *)url;

@end
