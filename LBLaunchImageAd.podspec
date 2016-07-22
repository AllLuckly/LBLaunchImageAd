Pod::Spec.new do |s|
    s.name         = "LBLaunchImageAd"
    s.version      = "1.0.0"
    s.summary      = "使用SDWebImage来设置启动时植入广告"
    s.homepage     = "https://github.com/AllLuckly/LBLaunchImageAd"
    s.license      = "MIT"
    s.author             = { "liubin" => "lbjobvip@163.com" }
    s.social_media_url   = "https://github.com/AllLuckly"
    s.platform     = :ios, "7.0"
    s.source       = { :git => "https://github.com/AllLuckly/LBLaunchImageAd.git", :tag =>"1.0.0"}
    s.source_files  = "LBLaunchImageAd/**/*.{h,m}"
    s.requires_arc = true
    s.dependency 'SDWebImage'
# Pod Dependencies

end