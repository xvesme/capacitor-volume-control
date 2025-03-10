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
        observeInterruption()
    }

    private func setupVolumeView() {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.windows.first {
                self.volumeView.showsRouteButton = false
                self.volumeView.alpha = 0.01
                self.volumeView.frame = CGRect(x: -1000, y: -1000, width: 1, height: 1)
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

    private func observeInterruption() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleAudioInterruption(_:)), name: AVAudioSession.interruptionNotification, object: nil)
    }

    @objc private func handleAudioInterruption(_ notification: Notification) {
        if let userInfo = notification.userInfo,
            let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type = AVAudioSession.InterruptionType(rawValue: typeValue) {
            if type == .began {
                NotificationCenter.default.post(name: Notification.Name("AudioInterrupted"), object: nil, userInfo: ["playing": false])
            } else if type == .ended {
                NotificationCenter.default.post(name: Notification.Name("AudioInterrupted"), object: nil, userInfo: ["playing": true])
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
                    slider.setValue(value / 100, animated: false)
                    return
                }
            }
        }
    }
}
