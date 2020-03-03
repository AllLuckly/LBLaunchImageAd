Pod::Spec.new do |s|

    s.name         = "LBLaunchImageAd"

    s.version      = "1.1.1"

    s.summary      = "轻量级iOS开发启动广告，动态获取启动图片，支持半屏和全屏，类似百度ssp广告和广点通的广告。支持广告点击等，集成非常的方便。支持LaunchScreen.storyboard和LaunchImage无痕切换"

    s.homepage     = "https://github.com/AllLuckly/LBLaunchImageAd"

    s.license      = "MIT"

    s.author             = { "Bison" => "lbjobvip@163.com",
                            "倪新生" => "1911398892@qq.com" }

    s.social_media_url   = "https://github.com/AllLuckly"

    s.platform     = :ios, "8.0"

    s.source       = { :git => "https://github.com/AllLuckly/LBLaunchImageAd.git", :tag => s.version}

    s.source_files  = "LBLaunchImageAdDemo/LBLaunchImageAdDemo/LBLaunchImageAd/**/*.{h,m}"

    s.requires_arc = true
    
    s.dependency 'SDWebImage'

    s.dependency 'SDWebImage/GIF'

end
