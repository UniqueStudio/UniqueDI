#
#  Be sure to run `pod spec lint UniqueDI.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "UniqueDI"
  spec.version      = "0.0.1"
  spec.summary      = "An easy Dependency Injection developered by UniqueStudio."
  spec.description  = <<-DESC
                      a naive Dependency Injection (Dependence Inversion ,to be more accurate) with Context Isolation.
                   DESC

  spec.homepage     = "https://github.com/UniqueStudio/UniqueDI"
  spec.license      = "MIT"
  spec.author             = { "MacsedProtoss" => "macsedprotoss@gmail.com" }

  spec.platform     = :ios
  spec.platform     = :ios, "10.0"

  spec.source       = { :git => "https://github.com/UniqueStudio/UniqueDI.git", :tag => "#{spec.version}" }
  spec.source_files  = "UniqueDI/*"
  spec.requires_arc = true
  s.frameworks="Foundation"
  spec.public_header_files = "UniqueDI/UniqueDI.h"

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
