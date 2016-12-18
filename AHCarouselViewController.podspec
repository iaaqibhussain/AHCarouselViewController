#
# Be sure to run `pod lib lint AHCarouselViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AHCarouselViewController'
  s.version          = '0.1.0'
  s.summary          = 'A simple carousel library written in Swift 3.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'AHCarouselViewController Provides you the ability to create your image slider with few lines of code.'


  s.homepage         = 'https://github.com/iaaqib/AHCarouselViewController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aaqib Hussain' => 'iaaqibhussain@outlook.com' }
  s.source           = { :git => 'https://github.com/iaaqib/AHCarouselViewController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.3'

  s.source_files = 'AHCarouselViewController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AHCarouselViewController' => ['AHCarouselViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
