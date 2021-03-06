#
# Be sure to run `pod lib lint iosManagers.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iosManagers'
  s.version          = '1.0.7'
  s.summary          = 'This is a pod that makes creating programmatic UI easier, and also improves other typical programming tasks in.'
  s.swift_version    = '3.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is a pod that makes creating programmatic UI easier, and also improves other typical programming tasks in Swift.
                       DESC

  s.homepage         = 'https://github.com/ajaymerchia/iosManagers'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ajaymerchia' => 'ajaymerchia@berkeley.edu' }
  s.source           = { :git => 'https://github.com/ajaymerchia/iosManagers.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.1'

  s.source_files = 'Classes/*.swift'
  
  s.dependency 'JGProgressHUD'
  
  # s.resource_bundles = {
  #   'iosManagers' => ['iosManagers/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
