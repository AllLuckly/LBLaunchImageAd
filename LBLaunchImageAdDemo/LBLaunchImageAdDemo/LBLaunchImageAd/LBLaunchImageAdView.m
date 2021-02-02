//  好用请star：https://github.com/AllLuckly/LBLaunchImageAd
//  LBLaunchImageAdView.m
//  LBLaunchImageAd
//  技术交流群：534926022（免费） 511040024(0.8元/人付费)
//  Created by gold on 16/6/8.
//  Copyright © 2016年 Bison. All rights reserved.
//  iOS开发学习app下载https://itunes.apple.com/cn/app/it-blog-for-ios-developers/id1067787090?mt=8

#import "LBLaunchImageAdView.h"
#import "UIImageView+WebCache.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"


#define mainHeight      [[UIScreen mainScreen] bounds].size.height
#define mainWidth       [[UIScreen mainScreen] bounds].size.width
#define KIsiPhoneXs ((int)((mainHeight/mainWidth)*100) == 216)?YES:NO
#define IMGURL @"IMGURL"
#define ISCLICKADVIEW @"ISCLICKADVIEW"
#define ADVERTURL @"ADVERTURL"

@interface LBLaunchImageAdView()
{
    NSTimer *countDownTimer;
}

@property (strong, nonatomic) NSString *isClick;

@end

@implementation LBLaunchImageAdView

#pragma mark - 获取广告类型
- (void (^)(AdType adType))getLBlaunchImageAdViewType{
    __weak typeof(self) weakSelf = self;
    return ^(AdType adType){
        [weakSelf addLBlaunchImageAdView:adType];
    };
}

#pragma mark - 点击广告
- (void)activiTap:(UITapGestureRecognizer*)recognizer{
    _isClick = @"1";
    [self startcloseAnimation];
}

#pragma mark - 开启关闭动画
- (void)startcloseAnimation{
    self.backgroundColor = UIColor.whiteColor;
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = 0.5;
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.3];
    opacityAnimation.removedOnCompletion = NO;
    opacityAnimation.fillMode = kCAFillModeForwards;
    [self.aDImgView.layer addAnimation:opacityAnimation forKey:@"animateOpacity"];
    [NSTimer scheduledTimerWithTimeInterval:opacityAnimation.duration
                                     target:self
                                   selector:@selector(closeAddImgAnimation)
                                   userInfo:nil
                                    repeats:NO];    
}

- (void)skipBtnClick{
    _isClick = @"2";
    [self startcloseAnimation];
}

#pragma mark - 关闭动画完成时处理事件
-(void)closeAddImgAnimation
{
    [countDownTimer invalidate];
    countDownTimer = nil;
    
    if ([_isClick integerValue] == 1) {
        if (self.clickBlock) {//点击广告
            self.clickBlock(clickAdType); 
        }
    }else if([_isClick integerValue] == 2){
        if (self.clickBlock) {//点击跳过
            self.clickBlock(skipAdType);
        }
    }else{
        if (self.clickBlock) {
            self.clickBlock(overtimeAdType);
        }
    }
    self.hidden = YES;
    self.aDImgView.hidden = YES;
}

- (void)onTimer {
    if (_adTime == 0) {
        [countDownTimer invalidate];
        countDownTimer = nil;
        [self startcloseAnimation];
    }else{
        [self.skipBtn setTitle:[NSString stringWithFormat:@"%@ | 跳过",@(_adTime--)] forState:UIControlStateNormal];
    }
}

- (void)setLocalAdImgName:(NSString *)localAdImgName{
    _localAdImgName = localAdImgName;
    if (_localAdImgName.length > 0) {
        if ([_localAdImgName rangeOfString:@".gif"].location  != NSNotFound ) {
            _localAdImgName  = [_localAdImgName stringByReplacingOccurrencesOfString:@".gif" withString:@""];
            NSData *gifData = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:_localAdImgName ofType:@"gif"]];
            FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:gifData];
            FLAnimatedImageView *adImageView = (FLAnimatedImageView *)self.aDImgView;
            adImageView.contentMode = UIViewContentModeScaleAspectFill;
            adImageView.clipsToBounds = YES;
            adImageView.animatedImage = image;
            [self.aDImgView bringSubviewToFront:_skipBtn];
        }else{
            self.aDImgView.image = [UIImage imageNamed:_localAdImgName];
        }
    }
}


-(void)setImgUrl:(NSString *)imgUrl{
    _imgUrl = imgUrl;
    if ([self isImgCache] == nil) {
        [_aDImgView sd_setImageWithURL:[NSURL URLWithString:_imgUrl] placeholderImage:nil];
    }
    NSUserDefaults *userDf = [NSUserDefaults standardUserDefaults];
    [userDf setObject:_imgUrl forKey:IMGURL];
}

- (void)setIsClickAdView:(BOOL)isClickAdView{
    _isClickAdView = isClickAdView;
    NSUserDefaults *userDf = [NSUserDefaults standardUserDefaults];
    [userDf setObject:@(isClickAdView) forKey:ISCLICKADVIEW];
}

-(void)setAdvertUrl:(NSString *)advertUrl{
    _advertUrl = advertUrl;
    NSUserDefaults *userDf = [NSUserDefaults standardUserDefaults];
    [userDf setObject:advertUrl forKey:ADVERTURL];
}


- (void)addLBlaunchImageAdView:(AdType)adType{
    #pragma mark - iOS开发 强制竖屏。系统KVO 强制竖屏—>适用于支持各种方向屏幕启动时，竖屏展示广告 by:nixs
    NSNumber * orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    //倒计时时间
    _adTime = 6;
    [[self keyWindow] makeKeyAndVisible];
    NSString *launchImageName = [self getLaunchImage:@"Portrait"];
    UIImage * launchImage = [UIImage imageNamed:launchImageName];
    if (launchImage == nil) {//没有获取到图片自动获取LaunchScreen.storyboard
        launchImage = [self imageFromLaunchScreen];
    }
    self.backgroundColor = [UIColor colorWithPatternImage:launchImage];
    self.frame = CGRectMake(0, 0, mainWidth, mainHeight);
    if (adType == FullScreenAdType) {
        self.aDImgView = [[FLAnimatedImageView alloc]initWithFrame:CGRectMake(0, 0, mainWidth, mainHeight)];
    }else{
        self.aDImgView = [[FLAnimatedImageView alloc]initWithFrame:CGRectMake(0, 0, mainWidth, mainHeight - mainWidth/3)];
    }
    self.skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.skipBtn.frame = CGRectMake(mainWidth - 70, 20, 60, 30);
    if (KIsiPhoneXs) {
        self.skipBtn.frame = CGRectMake(mainWidth - 70, 40, 60, 30);
    }
    self.skipBtn.backgroundColor = [UIColor brownColor];
    self.skipBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.skipBtn addTarget:self action:@selector(skipBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.skipBtn.layer.cornerRadius = 3;
    self.skipBtn.clipsToBounds = YES;

    self.aDImgView.tag = 1101;
    [self addSubview:self.aDImgView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(activiTap:)];
    // 允许用户交互
    self.aDImgView.userInteractionEnabled = YES;
    [self.aDImgView addGestureRecognizer:tap];

    if ([self isImgCache].length > 0) {
        [_aDImgView sd_setImageWithURL:[NSURL URLWithString:[self isImgCache]] placeholderImage:nil];
    }
    _isClickAdView = [self isClickAdViewCache];
    if ([self isAdvertUrlCache].length > 0) {
        _advertUrl = [self isAdvertUrlCache];
    }
    [self addSubview:self.skipBtn];
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    UIViewController *vc = [UIViewController new];
    [vc.view addSubview:self];
    [self keyWindow].rootViewController = vc;
}



- (NSString *)getLaunchImage:(NSString *)viewOrientation{
    //获取启动图片
    CGSize viewSize = [self keyWindow].bounds.size;
    __block NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    [imagesDict enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGSize imageSize = CGSizeFromString(obj[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:obj[@"UILaunchImageOrientation"]])
        {
            launchImageName = obj[@"UILaunchImageName"];
        }
    }];
    return launchImageName;
}

- (NSString *)isImgCache{
    NSUserDefaults *userDf = [NSUserDefaults standardUserDefaults];
    NSString *imgURL = [userDf objectForKey:IMGURL];
    if (imgURL.length > 0) {
        return imgURL;
    }
    return nil;
}

- (NSString *)isAdvertUrlCache{
    NSUserDefaults *userDf = [NSUserDefaults standardUserDefaults];
    NSString *advertUrl = [userDf objectForKey:ADVERTURL];
    if (advertUrl.length > 0) {
        return advertUrl;
    }
    return nil;
}

- (BOOL)isClickAdViewCache{
    NSUserDefaults *userDf = [NSUserDefaults standardUserDefaults];
    NSNumber *isClick  = [userDf objectForKey:ISCLICKADVIEW];
    return [isClick boolValue];
}


-(UIImage *)imageFromLaunchScreen{
    NSString *UILaunchStoryboardName = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchStoryboardName"];
    if(UILaunchStoryboardName == nil){
        return nil;
    }
    UIViewController *LaunchScreenSb = [[UIStoryboard storyboardWithName:UILaunchStoryboardName bundle:nil] instantiateInitialViewController];
    if(LaunchScreenSb){
        UIView * view = LaunchScreenSb.view;
        // 加入到UIWindow后，LaunchScreenSb.view的safeAreaInsets在刘海屏机型才正常。
        UIWindow *containerWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        containerWindow.backgroundColor = UIColor.whiteColor;
        view.frame = containerWindow.bounds;
        [containerWindow addSubview:view];
        [containerWindow layoutIfNeeded];
        UIImage *image = [self imageFromView:view];
        containerWindow = nil;
        return image;
    }
    return nil;
}

-(UIImage*)imageFromView:(UIView*)view{
    //fix bug:https://github.com/CoderZhuXH/XHLaunchAd/issues/203
    if (CGRectIsEmpty(view.frame)) {
        return nil;
    }
    CGSize size = view.bounds.size;
    //参数1:表示区域大小 参数2:如果需要显示半透明效果,需要传NO,否则传YES 参数3:屏幕密度
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    }else{
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(UIWindow*)keyWindow
{
    UIWindow *foundWindow = nil;
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow *window in windows) {
        if (window.isKeyWindow) {
            foundWindow = window;
            break;
        }
    }
    if (foundWindow == nil) {
        foundWindow = [UIApplication sharedApplication].delegate.window;
    }
    return foundWindow;
}


@end
