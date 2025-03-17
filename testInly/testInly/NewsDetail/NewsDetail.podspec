Pod::Spec.new do |s|
  s.name             = 'NewsDetail'
  s.version          = '0.1.0'
  s.summary          = 'Module for detailed news view'
  s.description      = 'NewsDetail module handles displaying detailed news'
  s.homepage         = 'https://github.com/yourusername/NewsDetail'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your.email@example.com' }
  s.source           = { :git => 'https://github.com/yourusername/NewsDetail.git', :tag => '0.1.0' }
  s.source_files     = 'NewsDetail/Sources/**/*'
  s.dependency 'Toast-Swift'
  s.platform         = :ios, '15.6'
end
