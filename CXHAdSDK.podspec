#
# Be sure to run `pod lib lint CXHAdSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CXHAdSDK'
  s.version          = '1.5.0'
  s.summary          = 'A short description of CXHAdSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://gitee.com/huazi-rongchuang/cxhadsdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '华资融创' => '10675175+huazi-rongchuang@user.noreply.gitee.com' }
  s.source           = { :git => 'https://gitee.com/huazi-rongchuang/cxhadsdk.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  
  s.frameworks = 'UIKit'
  s.requires_arc = true
  s.static_framework = true
  
  s.dependency 'CXHAdSDK-Kit', '1.5.0'
  s.dependency 'CXHAdSDK-Adapter', '1.5.0'
  
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  
  s.xcconfig = {"OTHER_LDFLAGS"=>"-ObjC"}
  
  s.default_subspecs = 'Core'
  
  s.subspec 'Core' do |sp|
    sp.ios.vendored_frameworks =  ['CXHAdSDK/Classes/Core/CXHAdSDK-Core.framework']
  end
  
  s.subspec 'Channel' do |channel|
    channel.dependency 'CXHAdSDK/Core'
    # channel.dependency 'WechatOpenSDK', '2.0.4'
    channel.frameworks = 'CoreMotion'
    channel.ios.vendored_frameworks =  ['CXHAdSDK/Classes/Channel/CXHAdSDK-Channel.framework']
  end
  
  s.subspec 'ChannelNoWechat' do |channelNoWechat|
    channelNoWechat.dependency 'CXHAdSDK/Core'
    channelNoWechat.frameworks = 'CoreMotion'
    channelNoWechat.ios.vendored_frameworks =  ['CXHAdSDK/Classes/Channel/CXHAdSDK-Channel.framework']
  end
  
  s.subspec 'GDT' do |gdt|
    gdt.dependency 'CXHAdSDK/Core'
    gdt.dependency 'GDTMobSDK', '4.14.60'
    gdt.ios.vendored_frameworks =  ['CXHAdSDK/Classes/GDT/CXHAdSDK-GDT.framework']
  end
  
  s.subspec 'MobTech' do |tech|
    tech.dependency 'CXHAdSDK/Core'
    tech.dependency 'MOBFoundation', '3.2.61'
    tech.ios.vendored_frameworks = ['CXHAdSDK/Classes/MobTech/CXHAdSDK-MobTech.framework']
  end
  
  s.subspec 'RC' do |rc|
    rc.dependency 'CXHAdSDK/Core'
    rc.ios.vendored_frameworks = ['CXHAdSDK/Classes/RC/CXHAdSDK-RC.framework']
  end
  
  
  # s.resource_bundles = {
  #   'CXHAdSDK' => ['CXHAdSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end