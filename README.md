# LBLaunchImageAd

[![Codewake](https://www.codewake.com/badges/ask_question.svg)](https://www.codewake.com/p/lblaunchimagead)
[![Build Status](http://img.shields.io/travis/AllLuckly/LBLaunchImageAd/master.svg?style=flat)](https://travis-ci.org/AllLuckly/LBLaunchImageAd)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/AllLuckly/LBLaunchImageAd)


## 技术交流群：534926022（免费） 511040024(0.8/人付费)

### [iOS开发学习app下载](https://itunes.apple.com/cn/app/it-blog-for-ios-developers/id1067787090?mt=8)

### [实现原理介绍](http://www.jianshu.com/p/10c35dfc0a4a)

效果图如下：

![(LBLaunchImageAd)](https://github.com/AllLuckly/LBLaunchImageAd/blob/master/Untitled.gif?raw=true)




本框架依赖`SDWebImage`

导入`LBLaunchImageAd`

在`AppDelegate.m`的`didFinishLaunchingWithOptions`方法中复制如下代码即可

## 如果需要网络请求得到URL的例子如下

```
    //初始化一个adView
    LBLaunchImageAdView * adView = [[LBLaunchImageAdView alloc]init];
    //举个例子[LBNetWork PostAPI:url Dic:nil Suc:^(NSDictionary *Res)是自己封装的网络请求    
    [LBNetWork PostAPI:url Dic:nil Suc:^(NSDictionary *Res) {

        NSArray *arr = Res[@"resultContent"];
        NSString *imgURL = nil;
        for (NSDictionary *dic in arr) {
            imgURL = [NSString stringWithFormat:@"xxxxx%@",dic[@"imgpath"]] ;
        }
        //关键地方
        if (imgURL) {
            adView.getLBlaunchImageAdViewType(LogoAdType);
            adView.imgUrl = imgURL;
            //各种回调
            adView.clickBlock = ^(NSInteger tag){
                switch (tag) {
                    case 1100:{
                        
                    }
                        break;
                    case 1101:
                        NSLog(@"点击跳过回调");
                        self.window.rootViewController = _tabBarController;
                        break;
                    case 1102:
                        NSLog(@"倒计时完成后的回调");
                        self.window.rootViewController = _tabBarController;
                        break;
                    default:
                        break;
                }
                
            };
        }

    } Fai:^(NSURLSessionDataTask *operation) {
        
    }];

```

## 如果直接是固定的图片Url

```
    LBLaunchImageAdView * adView = [[LBLaunchImageAdView alloc]init];
    adView.getLBlaunchImageAdViewType(LogoAdType);
    adView.imgUrl = @"http://www.uisheji.com/wp-content/uploads/2013/04/19/app-design-uisheji-ui-icon20121_55.jpg";
    adView.clickBlock = ^(NSInteger tag){
        switch (tag) {
            case 1100:{
                
            }
                break;
            case 1101:
                NSLog(@"点击跳过回调");
                self.window.rootViewController = _tabBarController;
                break;
            case 1102:
                NSLog(@"倒计时完成后的回调");
                self.window.rootViewController = _tabBarController;
                break;
            default:
                break;
        }
                    
    };

```

## 如果是本地图片


```

LBLaunchImageAdView * adView = [[LBLaunchImageAdView alloc]init];
adView.getLBlaunchImageAdViewType(LogoAdType);
adView.localAdImgName = @"qidong.png"; 
//各种回调
adView.clickBlock = ^(NSInteger tag){
    switch (tag) {
        case 1100:{
            NSLog(@"点击广告回调");
            TestViewController *vc = [[TestViewController alloc]init];
            vc.view.backgroundColor = [UIColor whiteColor];
            [self.window.rootViewController presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
        case 1101:
            NSLog(@"点击跳过回调");
            break;
        case 1102:
            NSLog(@"倒计时完成后的回调");
            break;
        default:
            break;
    }
    
};

```



