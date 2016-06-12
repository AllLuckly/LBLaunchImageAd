# LBLaunchImageAd

技术交流群：534926022（免费） 511040024(0.8/人付费)

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
