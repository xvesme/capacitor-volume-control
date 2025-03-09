#import <Capacitor/Capacitor.h>

CAP_PLUGIN(VolumeControlPlugin, "VolumeControl",
    CAP_PLUGIN_METHOD(setVolume, CAPPluginReturnNone);
    CAP_PLUGIN_METHOD(getVolume, CAPPluginReturnPromise);
)
