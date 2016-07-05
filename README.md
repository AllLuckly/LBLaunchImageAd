# LBLaunchImageAd

##技术交流群：534926022（免费） 511040024(0.8/人付费)

###[iOS开发学习app下载](https://itunes.apple.com/cn/app/it-blog-for-ios-developers/id1067787090?mt=8)

###[实现原理介绍](http://www.jianshu.com/p/10c35dfc0a4a)

效果图如下：

![(LBLaunchImageAd)](https://github.com/AllLuckly/LBLaunchImageAd/blob/master/Untitled.gif?raw=true)




本框架依赖`SDWebImage`

导入`LBLaunchImageAd`

在`AppDelegate.m`的`didFinishLaunchingWithOptions`方法中复制如下代码即可

```
LBLaunchImageAdView * adView = [[LBLaunchImageAdView alloc]initWithWindow:self.window andType:LogoAdType andImgUrl:@"http://www.uisheji.com/wp-content/uploads/2013/04/19/app-design-uisheji-ui-icon20121_55.jpg"];
    
    //各种回调
    adView.clickBlock = ^(NSInteger tag){
        switch (tag) {
            case 1100:{
                NSLog(@"点击广告回调");
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


