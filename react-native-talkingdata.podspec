require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name          = 'react-native-talkingdata' # can not containers character '@' or '/', fix bug about '[!] No podspec found for xxx'
  s.version       = package['version']
  s.summary       = package['description']
  s.description   = package['description']
  s.homepage      = package['homepage']
  s.license       = package['license']
  s.author        = package['author']
  s.platform      = :ios, "9.0"
  s.source        = { :git => "https://github.com/krmao/react-native-talkingdata.git", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m}"
  s.resources     = ['*.bundle', '*.strings']
  s.requires_arc  = true

  s.libraries = 'c++', 'z'
  s.vendored_libraries = "ios/libTalkingDataSDK.a"
  s.frameworks = 'AdServices', 'iAd', 'StoreKit', 'AppTrackingTransparency', 'AdSupport', 'CoreTelephony', 'Security', 'SystemConfiguration'
end
