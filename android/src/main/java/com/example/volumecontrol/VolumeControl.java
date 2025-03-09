package com.example.volumecontrol;

import android.content.Context;
import android.media.AudioManager;

public class VolumeControl {
    private final AudioManager audioManager;

    public VolumeControl(Context context) {
        this.audioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
    }

    public void setVolume(float value) {
        int maxVolume = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
        int newVolume = (int) (value * maxVolume);
        audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, newVolume, 0);
    }

    public float getVolume() {
        int maxVolume = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
        int currentVolume = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC);
        return (float) currentVolume / maxVolume;
    }
}
