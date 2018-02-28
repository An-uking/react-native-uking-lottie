#
#  Be sure to run `pod spec lint RCTFastImageView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "RCTLottieView"
  s.version      = "0.0.1"
  s.summary      = "React Native RCTLottieView Bridge"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                  React Native RCTLottieView Bridge
                   DESC

  s.homepage     = "https://github.com/An-uking/react-native-uking-lottie/readme"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "uking" => "ptvile@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/An-uking/react-native-uking-lottie.git", :tag => "master" }
  s.source_files  = "RCTLottieView/**/*"
  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency "React"
  s.dependency "lottie-ios"
end