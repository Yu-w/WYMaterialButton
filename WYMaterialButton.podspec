#
# Be sure to run `pod lib lint WYMaterialButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "WYMaterialButton"
  s.version          = "2.0.2"
  s.summary          = "Interactive and fully animated Material Design button for iOS developers."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
            WYMaterialButton implemented Material Design on iOS, allowing iOS buttons to be more responsive and interactive.
            Integrated with Spring and pop animations, WYMaterialButton is super animated and programmer-friendly. All settings can be customized in storyboard inspector.
                   DESC

  s.homepage         = "https://github.com/yuwang17/WYMaterialButton"
  # s.screenshots     =  "https://github.com/yuwang17/WYMaterialButton/Screenshot/single.tiff"
  s.license          = 'MIT'
  s.author           = { "Yu Wang" => "wangyu2165@gmail.com" }
  s.source           = { :git => "https://github.com/yuwang17/WYMaterialButton.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'WYMaterialButton' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'pop', '~> 1.0'
end
