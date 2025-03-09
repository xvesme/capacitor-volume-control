import Foundation
import MediaPlayer
import Capacitor

@objc(VolumeControl)
public class VolumeControl: CAPPlugin {
    private let volumeView = MPVolumeView()

    override public func load() {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.windows.first {
                self.volumeView.alpha = 0.01 // Приховуємо стандартний слайдер
                window.addSubview(self.volumeView)
            }
        }
    }

    @objc func getVolume(_ call: CAPPluginCall) {
        let volume = AVAudioSession.sharedInstance().outputVolume
        call.resolve(["value": volume * 100])
    }

    @objc func setVolume(_ call: CAPPluginCall) {
        guard let value = call.getFloat("value") else {
            call.reject("Missing 'value' parameter")
            return
        }

        DispatchQueue.main.async {
            for view in self.volumeView.subviews {
                if let slider = view as? UISlider {
                    slider.value = value / 100
                    break
                }
            }
        }

        call.resolve()
    }
}
