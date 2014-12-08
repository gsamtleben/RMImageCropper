#
# Be sure to run `pod lib lint RMImageCropper.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RMImageCropper"
  s.version          = "0.1.0"
  s.summary          = "A simple image cropper that pans the image to crop instead of using a cropping rectangle."
  s.homepage         = "https://github.com/gsamtleben/RMImageCropper"
  s.license          = 'MIT'
  s.author           = { "Geoffrey Samtleben" => "gsamtleben@gmail.com" }
  s.source           = { :git => "https://github.com/gsamtleben/RMImageCropper.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'RMImageCropper' => ['Pod/Assets/*.png']
  }
  s.public_header_files = 'Pod/Classes/RMImageCropper.h'
  s.frameworks = 'UIKit'
end
