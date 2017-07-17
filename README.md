# LBLaunchImageAd

[![Codewake](https://www.codewake.com/badges/ask_question.svg)](https://www.codewake.com/p/lblaunchimagead)
[![Build Status](http://img.shields.io/travis/AllLuckly/LBLaunchImageAd/master.svg?style=flat)](https://travis-ci.org/AllLuckly/LBLaunchImageAd)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/AllLuckly/LBLaunchImageAd)
[![Pod Platform](http://img.shields.io/cocoapods/p/LBLaunchImageAd.svg?style=flat)](http://cocoadocs.org/docsets/LBLaunchImageAd/)
[![Pod Version](http://img.shields.io/cocoapods/v/LBLaunchImageAd.svg?style=flat)](http://cocoadocs.org/docsets/LBLaunchImageAd/)
[![Pod License](http://img.shields.io/cocoapods/l/LBLaunchImageAd.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)


## 支持pod导入

pod 'LBLaunchImageAd','~> 1.0.1'

如果发现`pod search LBLaunchImageAd` 搜索出来的不是最新版本，需要在终端执行cd转换文件路径命令退回到desktop，然后执行`pod setup`命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了;也可以试下如下方法

```
rm ~/Library/Caches/CocoaPods/search_index.json
```

然后再`pod search LBLaunchImageAd`

---

`2017年07月17日14:23:03 by:nixs "倪新生" => "1911398892@qq.com"`

```
1、#pragma mark - 工程引入cocoapods管理;
2、#pragma mark - pod 'SDWebImage','~> 4.0.0' 更新;
3、#pragma mark - iOS开发 强制竖屏。系统KVO 强制竖屏—>适用于支持各种方向屏幕启动时，竖屏展示广告; by:nixs
4、最低iOS系统支持 s.platform     = :ios, "8.0"

```
![](./QQ20170717-142110-HD.gif)
![](./166D7B31-0B02-402B-9F38-04C9424648F1.png)
---

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
    
        [LBNetWork PostAPI:url Dic:nil Suc:^(NSDictionary *Res) {

            NSArray *arr = Res[@"resultContent"];
            NSString *imgURL = nil;
            for (NSDictionary *dic in arr) {
                imgURL = [NSString stringWithFormat:@"xxxxx%@",dic[@"imgpath"]] ;
            }
            //关键地方
            if (imgURL) {
                __weak typeof(self) weakSelf = self;
                 //设置广告的类型
                imgAdView.getLBlaunchImageAdViewType(LogoAdType);
                //设置网络启动图片URL
                imgAdView.imgUrl = imgURL;
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
            }

    } Fai:^(NSURLSessionDataTask *operation) {
        
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

