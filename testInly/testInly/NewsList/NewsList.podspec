Pod::Spec.new do |s|
  s.name             = 'NewsList'
  s.version          = '0.1.0'
  s.summary          = 'Module for displaying news list'
  s.description      = 'NewsList module handles the list of news articles'
  s.homepage         = 'https://github.com/yourusername/NewsList'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your.email@example.com' }
  s.source           = { :git => 'https://github.com/yourusername/NewsList.git', :tag => '0.1.0' }
  s.source_files     = 'NewsList/Sources/**/*'
  s.dependency 'Alamofire'
  s.dependency 'SDWebImage'
  s.dependency 'Toast-Swift'
  s.platform         = :ios, '15.6'
end
