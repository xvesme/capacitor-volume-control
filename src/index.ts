import { registerPlugin } from '@capacitor/core';

// Оголошуємо інтерфейс плагіна
export interface VolumeControlPlugin {
  setVolume(options: { value: number }): Promise<void>;
  getVolume(): Promise<{ value: number }>;
}

// Реєструємо плагін
const VolumeControl = registerPlugin<VolumeControlPlugin>('VolumeControl');

export default VolumeControl;
