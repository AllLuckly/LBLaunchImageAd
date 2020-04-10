# LBLaunchImageAd

[![Apps Using](https://img.shields.io/badge/Apps%20Using-%3E%20500-00BFFF.svg?style=plastic)](https://cocoapods.org/pods/LBLaunchImageAd)
[![Codewake](https://www.codewake.com/badges/ask_question.svg)](https://www.codewake.com/p/lblaunchimagead)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/AllLuckly/LBLaunchImageAd)
[![Pod Platform](http://img.shields.io/cocoapods/p/LBLaunchImageAd.svg?style=flat)](http://cocoadocs.org/docsets/LBLaunchImageAd/)
[![Pod Version](http://img.shields.io/cocoapods/v/LBLaunchImageAd.svg?style=flat)](http://cocoadocs.org/docsets/LBLaunchImageAd/)
[![Pod License](http://img.shields.io/cocoapods/l/LBLaunchImageAd.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)


## 支持pod导入

pod 'LBLaunchImageAd','~> 1.1.2'

如果发现`pod search LBLaunchImageAd` 搜索出来的不是最新版本，需要在终端执行cd转换文件路径命令退回到desktop，然后执行`pod setup`命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了;也可以试下如下方法

```
rm ~/Library/Caches/CocoaPods/search_index.json
```

然后再`pod search LBLaunchImageAd`



### 本框架将用在[涂嗨oh](https://itunes.apple.com/cn/app/id1451568487)上线项目中，到时有兴趣的朋友可以下载看看效果

## 2020/04/10号更新：
### 1.1.1 删除UIWebView,升级SDWebImage为5.7.1版本

## 2020/03/03号更新：
### 1.1.1 LaunchScreen.storyboard和LaunchImage无痕切换;如果需要把LaunchImage换成LaunchScreen.storyboard只需要删除LaunchImage然后创建LaunchScreen.storyboard然后到项目中的TARGETS --> APP Icons and Launch Images 修改LaunchScreen File 为LaunchScreen即可

## 2018/10/21号更新：
### 1.0.9 适配iPhone XS+++

## 2018/9/08号更新：
### 1.0.8修复一些bug~

## 2018/2/02号更新：
### 1.0.6增加缓存，如果已经加载过启动图片，那么在没有网络的情况下也会加载，更新后台图片时，第一次加载的是原来已有的图片，下一次加载就是最新的图片了


## 2018/1/31号更新：
### 1.0.5修复网络gif图片只展示第一帧的bug,修复iPhone X 点击跳过无效的bug

## 2017/6/28号更新：
### 修复bug，修复cocopods版本不同步等问题


## 2017/4/1号更新：

### 1.优化封装调用接口
### 2.优化性能
### ps:有什么问题可以留言，好用请star支持

## 技术交流群：534926022（0.8/人付费） 511040024(0.8/人付费)

### [iOS开发学习app下载](https://itunes.apple.com/cn/app/it-blog-for-ios-developers/id1067787090?mt=8)

### [实现原理介绍](http://www.jianshu.com/p/10c35dfc0a4a)

效果图如下：

![(LBLaunchImageAd)](https://github.com/AllLuckly/LBLaunchImageAd/blob/master/Untitled.gif?raw=true)



本框架依赖`SDWebImage`

导入`#import "NSObject+LBLaunchImage.h"`

在`AppDelegate.m`的`didFinishLaunchingWithOptions`方法中复制如下代码即可

## 如果需要网络请求得到URL的例子如下

```
    //举个例子[LBNetWork PostAPI:url Dic:nil Suc:^(NSDictionary *Res)是自己封装的网络请求 
    [NSObject makeLBLaunchImageAdView:^(LBLaunchImageAdView *imgAdView) {
        //设置广告的类型
        imgAdView.getLBlaunchImageAdViewType(LogoAdType);
        //自定义跳过按钮
        imgAdView.skipBtn.backgroundColor = [UIColor lightGrayColor];
        imgAdView.skipBtn.alpha = 0.5;
        [imgAdView.skipBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        __block LBLaunchImageAdView *adView = imgAdView;
        imgAdView.clickBlock = ^(const clickType type) {
            switch (type) {
                case clickAdType:{
                    NSLog(@"点击广告回调");
                    if (adView.advertUrl.length > 10 && adView.isClickAdView) {
                        LBAdVC *vc = [[LBAdVC alloc]init];
                        vc.url = adView.advertUrl;
                        vc.view.backgroundColor = [UIColor whiteColor];
                        if (self.tabBarController) {
                            [self.window setRootViewController:self.tabBarController];
                        }else{
                            [self setupViewControllers];
                            [self.window setRootViewController:self.tabBarController];
                        }
                        CYLTabBarController *tab = (CYLTabBarController *)_window.rootViewController;
                        UINavigationController *nav = (UINavigationController *)tab.viewControllers[0];
                        vc.hidesBottomBarWhenPushed = YES;
                        [nav pushViewController:vc animated:YES];
                    }
                
                }
                break;
                case skipAdType:
                    NSLog(@"点击跳过回调");
                    if (self.tabBarController) {
                        [self.window setRootViewController:self.tabBarController];
                    }else{
                        [self setupViewControllers];
                        [self.window setRootViewController:self.tabBarController];
                    }
                
                
                break;
                case overtimeAdType:
                    NSLog(@"倒计时完成后的回调");
                    [self.window setRootViewController:self.tabBarController];
                break;
                default:
                break;
            }
        };
        ///网络请求
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        //        NSLog(@"%@",request.responseJSONObject);
            NSDictionary *dic = request.responseJSONObject;
            if (dic) {
                //设置网络启动图片URL
                imgAdView.imgUrl = dic[@"imgURl"];
                //点击响应的url
                imgAdView.advertUrl = dic[@"clickURl"];
                //是否能点击
                imgAdView.isClickAdView = [dic[@"isClick"] boolValue];
            }
        
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        }];
       
       
  }];
       
    

```

## 如果直接是固定的图片Url

```
    __weak typeof(self) weakSelf = self;
    [NSObject makeLBLaunchImageAdView:^(LBLaunchImageAdView *imgAdView) {
        //设置广告的类型
        imgAdView.getLBlaunchImageAdViewType(LogoAdType);
        imgAdView.imgUrl = @"http://www.uisheji.com/wp-content/uploads/2013/04/19/app-design-uisheji-ui-icon20121_55.jpg";
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

```

## 如果是本地图片


```

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

```

