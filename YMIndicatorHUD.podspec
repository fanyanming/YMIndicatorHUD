Pod::Spec.new do |s|

  s.name          = “YMIndicatorHUD”
  s.version       = “0.0.1”
  s.license       = "MIT"
  s.summary       = “A HUD view, which is easily use, and has a nice look!”
  s.homepage      = "https://github.com/fanyanming/YMIndicatorHUD"
  s.author        = “Yanming”
  s.source        = { :git => "https://github.com/fanyanming/YMIndicatorHUD.git", :tag => “0.0.1“ }
  s.requires_arc  = true
  s.description   = <<-DESC
                   A HUD view, which is easily use, and has a nice look!
  s.source_files  = "YMIndicatorHUD/*"
  s.platform      = :ios, '7.0'
  s.framework     = 'Foundation', 'CoreGraphics', 'UIKit'  

end