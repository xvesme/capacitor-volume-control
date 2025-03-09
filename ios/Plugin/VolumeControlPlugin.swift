import Foundation
import Capacitor

@objc(VolumeControlPlugin)
public class VolumeControlPlugin: CAPPlugin {
    private let volumeControl = VolumeControl()

    override public func load() {
        super.load()
        NotificationCenter.default.addObserver(self, selector: #selector(volumeDidChange(_:)), name: Notification.Name("VolumeDidChange"), object: nil)
    }

    @objc func setVolume(_ call: CAPPluginCall) {
        let value = call.getFloat("value") ?? 50
        volumeControl.setVolume(value)
        call.resolve()
    }

    @objc func getVolume(_ call: CAPPluginCall) {
        let value = volumeControl.getVolume()
        call.resolve(["value": value])
    }

    @objc private func volumeDidChange(_ notification: Notification) {
        if let userInfo = notification.userInfo, let value = userInfo["value"] as? Float {
            notifyListeners("volumeChange", data: ["value": value])
        }
    }
}
