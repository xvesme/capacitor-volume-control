import Foundation
import MediaPlayer
import AVFoundation
import Capacitor

@objc(VolumeControl)
public class VolumeControl: NSObject {
    private let volumeView = MPVolumeView()
    private var observer: NSKeyValueObservation?

    override init() {
        super.init()
        setupVolumeView()
        observeVolumeChanges()
    }

    private func setupVolumeView() {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.windows.first {
                self.volumeView.showsRouteButton = false
                self.volumeView.showsVolumeSlider = true // ✅ Відображаємо системний слайдер
                self.volumeView.alpha = 0.02 // 👀 Робимо майже невидимим, але не ховаємо повністю
                self.volumeView.frame = CGRect(x: 10, y: 10, width: 100, height: 30) // 📌 Маленький слайдер у кутку
                window.addSubview(self.volumeView)
            }
        }
    }

    private func observeVolumeChanges() {
        observer = AVAudioSession.sharedInstance().observe(\.outputVolume, options: [.new]) { _, change in
            if let newVolume = change.newValue {
                NotificationCenter.default.post(name: Notification.Name("VolumeDidChange"), object: nil, userInfo: ["value": newVolume * 100])
            }
        }
    }

    @objc func getVolume() -> Float {
        return AVAudioSession.sharedInstance().outputVolume * 100
    }

    @objc func setVolume(_ value: Float) {
        DispatchQueue.main.async {
            for view in self.volumeView.subviews {
                if let slider = view as? UISlider {
                    slider.setValue(value / 100, animated: false) // ✅ Оновлення гучності
                    slider.sendActions(for: .touchUpInside) // 🟢 Коректне оновлення системної гучності
                    return
                }
            }
        }
    }
}
