
Pod::Spec.new do |s|
  s.name             = 'AHCarouselViewController'
  s.version          = '0.1.0'
  s.summary          = 'A simple carousel library written in Swift 3.'


  s.description      = 'AHCarouselViewController Provides you the ability to create your image slider with few lines of code.'


  s.homepage         = 'https://github.com/iaaqib/AHCarouselViewController'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aaqib Hussain' => 'iaaqibhussain@outlook.com' }
  s.source           = { :git => 'https://github.com/iaaqib/AHCarouselViewController.git', :tag => s.version }

  s.ios.deployment_target = '9.0'

  s.source_files = 'AHCarouselViewController/Classes/**/*'
  

end
