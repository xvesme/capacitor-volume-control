package com.example.volumecontrol;

import com.getcapacitor.Plugin;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.PluginCall;
import org.json.JSONException;
import org.json.JSONObject;

@CapacitorPlugin(name = "VolumeControl")
public class VolumeControlPlugin extends Plugin {
    private VolumeControl implementation;

    @Override
    public void load() {
        implementation = new VolumeControl(getContext());
    }

    @PluginMethod
    public void setVolume(PluginCall call) {
        float volume = call.getFloat("value", 0.5f);
        implementation.setVolume(volume);
        call.resolve();
    }

    @PluginMethod
    public void getVolume(PluginCall call) {
        float volume = implementation.getVolume();
        JSONObject result = new JSONObject();
        try {
            result.put("value", volume);
            call.resolve(result);
        } catch (JSONException e) {
            call.reject("JSON Error", e);
        }
    }
}
