#
# Be sure to run `pod lib lint LBUIKitFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LBUIKitFramework'
  s.version          = '0.1.1'
  s.summary          = 'this is liubin uikit framework project'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
now this framework project contain alert  、progressView 、 emptyView and common utils
                       DESC

  s.homepage         = 'https://github.com/mushanlianshi/LBUIKitFramework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mushanlianshi' => 'liu_bin_home@163.com' }
  s.source           = { :git => 'https://github.com/mushanlianshi/LBUIKitFramework.git', :tag => s.version.to_s, :submodules => true }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LBUIKitFramework/LBUIKit/BLTUI.h'
  
   s.resource_bundles = {
     'LBUIKitFramework' => ['LBUIKitFramework/Resources/*.png']
   }


   #子目录
   s.subspec 'Header' do |ss|
    ss.source_files = 'LBUIKitFramework/LBUIKit/Header/BLTUICommonDefines.h'
   end

   s.subspec 'UIButton' do |ss|
    ss.dependency 'LBUIKitFramework/Header'
    ss.source_files = 'LBUIKitFramework/LBUIKit/UIButton/BLTUIResponseAreaButton.{h,m}'
   end

   s.subspec 'Category' do |ss|
    ss.dependency 'LBUIKitFramework/Header'
    ss.source_files = 'LBUIKitFramework/LBUIKit/Category/*.{h,m}' #Category下所有匹配的文件
   end


   s.subspec 'Alert' do |ss|
    ss.dependency 'LBUIKitFramework/UIButton'
    ss.dependency 'LBUIKitFramework/Category'
    ss.dependency 'LBUIKitFramework/Header'
    ss.source_files = 'LBUIKitFramework/LBUIKit/Alert/*.{h,m}'
   end
   
   s.subspec 'EmptyView' do |ss|
       ss.source_files = 'LBUIKitFramework/LBUIKit/EmptyView/*.{h,m}'
   end
   
   s.subspec 'ProgressView' do |ss|
       ss.source_files = 'LBUIKitFramework/LBUIKit/ProgressView/*.{h,m}'
   end
  
end
