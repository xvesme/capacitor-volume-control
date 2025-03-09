import Foundation
import Capacitor

@objc(VolumeControlPlugin)
public class VolumeControlPlugin: CAPPlugin {
    private let volumeControl = VolumeControl()

    @objc func setVolume(_ call: CAPPluginCall) {
        let value = call.getFloat("value") ?? 0.5
        volumeControl.setVolume(value)
        call.resolve()
    }

    @objc func getVolume(_ call: CAPPluginCall) {
        let value = volumeControl.getVolume()
        call.resolve(["value": value])
    }
}
