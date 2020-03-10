Pod::Spec.new do |s|
  s.name             = 'LocalizedSwift'
  s.version          = '1.0.1'
  s.summary          = 'Localize UI Components in a simple and declarative way'
  s.description      = <<-DESC
  LocalizedSwift provide a property wrapper to localize UI Components using a simple declarative qualifier.
                       DESC
  s.swift_version = '5.1'
  s.homepage         = 'https://github.com/MarioIannotta/LocalizedSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MarioIannotta' => 'info@marioiannotta.com' }
  s.source           = { :git => 'https://github.com/MarioIannotta/LocalizedSwift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MarioIannotta'
  s.ios.deployment_target = '10.0'
  s.source_files = 'Sources/**/*'
end
