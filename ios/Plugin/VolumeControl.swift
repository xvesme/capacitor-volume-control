import Foundation
import MediaPlayer
import AVFoundation
import Capacitor

@objc(VolumeControl)
public class VolumeControl: NSObject {
    private let volumeView = MPVolumeView()

    override init() {
        super.init()
        setupVolumeView()
    }

    private func setupVolumeView() {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.windows.first {
                self.volumeView.showsRouteButton = false
                self.volumeView.showsVolumeSlider = false
                self.volumeView.isHidden = true

                window.addSubview(self.volumeView)
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
                    slider.value = value / 100
                    return
                }
            }
        }
    }
}
