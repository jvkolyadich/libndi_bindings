#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint libndi_bindings.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'libndi_bindings'
  s.version          = '0.0.1'
  s.summary          = 'Minimal project to get libndi bindings to work on ios.'
  s.description      = <<-DESC
Minimal project to get libndi bindings to work on ios.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  # This will ensure the source files in Classes/ are included in the native
  # builds of apps using this FFI plugin. Podspec does not support relative
  # paths, so Classes contains a forwarder C file that relatively imports
  # `../src/*` so that the C sources can be shared among all target platforms.
  s.source           = { :path => '.' }
  s.public_header_files = 'Classes/libndi_bindings.h'
  s.static_framework = true
  s.vendored_libraries = 'Frameworks/libndi_ios.a'
  # s.vendored_frameworks = 'Frameworks/libndi_ios.xcframework'

  s.dependency 'Flutter'
  s.platform = :ios, '10.0'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    # Flutter.framework does not contain a i386 slice.
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    'OTHER_LDFLAGS' => '-force_load $(PODS_TARGET_SRCROOT)/Frameworks/libndi_ios.a'
    # 'OTHER_LDFLAGS[sdk=iphoneos*]' => '-force_load $(PODS_TARGET_SRCROOT)/Frameworks/libndi_ios.xcframework/ios-arm64_armv7/libndi_ios.a',
    # 'OTHER_LDFLAGS[sdk=iphonesimulator*]' => '-force_load $(PODS_TARGET_SRCROOT)/Frameworks/libndi_ios.xcframework/ios-arm64_x86_64-simulator/libndi_ios.a'
  }
  s.swift_version = '5.0'
end
