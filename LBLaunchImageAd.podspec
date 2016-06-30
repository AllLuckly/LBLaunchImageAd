Pod::Spec.new do |s|
  s.name         = 'LBLaunchImageAd'
  s.version      = '1.0.0'
  s.summary      = 'IOS Paul started advertising function'
  s.homepage     = 'https://github.com/AllLuckly/LBLaunchImageAd'
  s.license      = "MIT"
  s.author       = { 'liubin' => 'lbjobvip@163.com' }
  s.platform     = :ios
  s.platform     = :ios, "7.0"
  s.source       = { :git => 'https://github.com/AllLuckly/LBLaunchImageAd.git', :tag => s.version }
  s.source_files  = 'LBLaunchImageAd/*'
  s.requires_arc = true
  s.dependency 'SDWebImage', '~> 3.7'
end
