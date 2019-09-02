Pod::Spec.new do |s|
s.name             = "SWUIKitExtensions"
s.version          = "1.0.2"
s.summary          = "UIKit Extensions"
s.homepage         = "https://github.com/547/SWUIKitExtensions"
s.license          = 'MIT'
s.author           = { "547" => "timer_sevenwang@163.com" }
s.source           = { :git => "https://github.com/547/SWUIKitExtensions.git", :tag => s.version.to_s }

s.requires_arc          = true

s.source_files = 'SWUIKitExtensions/SWUIKitExtensions/**/*.swift'

s.ios.deployment_target = '8.0'
end
