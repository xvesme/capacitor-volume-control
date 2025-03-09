Pod::Spec.new do |s|
  s.name              = 'CapacitorVolumeControl'
  s.version           = '1.0.0'
  s.summary           = 'Capacitor plugin for controlling device volume'
  s.description       = 'Capacitor plugin for controlling system volume on iOS and Android.'
  s.license           = { :type => 'MIT', :file => '../LICENSE' }
  s.homepage          = 'https://github.com/xvesme/capacitor-volume-control'
  s.author            = { 'xvesme' => 'your-email@example.com' }
  s.source            = { :git => 'https://github.com/xvesme/capacitor-volume-control.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_versions = ['5.0']

  # Виправлений шлях до файлів
  s.source_files = 'Plugin/**/*.{swift,m}'
  # 🔥 Видаляємо `s.public_header_files`, бо немає `.h` файлів
  s.exclude_files = 'Example'

  s.ios.vendored_frameworks = 'Plugin/*.framework'

  s.dependency 'Capacitor'
end
