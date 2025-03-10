Pod::Spec.new do |s|
  s.name              = 'CapacitorVolumeControl'
  s.version           = '1.0.0'
  s.summary           = 'Capacitor plugin for controlling device volume'
  s.description       = 'Capacitor plugin for controlling system volume on iOS and Android.'
  s.license           = { :type => 'MIT', :file => '../LICENSE' }
  s.homepage          = 'https://github.com/xvesme/capacitor-volume-control'
  s.author            = { 'mistofm' => 'support@mistofm.com' }
  s.source            = { :git => 'https://github.com/xvesme/capacitor-volume-control.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_versions = ['5.0']

  s.source_files = 'ios/Plugin/**/*.{swift,m}'
  s.exclude_files = 'Example'

  s.dependency 'Capacitor'
end
