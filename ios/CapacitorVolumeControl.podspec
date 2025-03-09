Pod::Spec.new do |s|
  s.name              = 'CapacitorVolumeControl'
  s.version           = '1.0.0'
  s.summary           = 'Capacitor plugin for controlling device volume'
  s.description       = 'Capacitor plugin for controlling system volume on iOS and Android.'
  s.license           = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage          = 'https://github.com/mgcrea/cordova-plugin-volume-control'  # 🔹 Замінити на реальний Git-репозиторій або будь-яку сторінку
  s.author            = { 'Your Name' => 'your-email@example.com' }
  s.source            = { :git => 'https://github.com/your-repo-url.git', :tag => '1.0.0' }  # 🔹 Додаємо підтримку Git
  s.source_files      = 'Plugin/**/*.{swift,h,m}'
  s.ios.deployment_target = '12.0'
  s.dependency 'Capacitor'
end
