Pod::Spec.new do |s|
  s.name         = 'EMNotificationPopup'
  s.version      = '0.2'
  s.summary      = 'EMNotificationPopup is a customizable, easy and ready to use notification Popup with nice animations.'
  s.homepage     = 'https://github.com/ennioma/EMNotificationPopup'
  s.license      = { :type => 'APACHE',
                     :file => 'LICENSE' }
  s.authors      = { 'Ennio Masi' => 'ennio.masi@gmail.com' }
  s.source       = { :git => 'https://github.com/ennioma/EMNotificationPopup.git',
                     :tag => s.version.to_s }
  s.platform     = :ios, '6.0'
  s.source_files = 'EMNotificationPopup'
  s.ios.frameworks   = 'CoreGraphics'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true
  s.social_media_url = 'https://twitter.com/ennioma'
end
