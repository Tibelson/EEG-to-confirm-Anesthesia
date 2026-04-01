clc;
clear;
close all;

% Load parameters
p = parameters();

% Generate EEG signals
[t, x_light, x_deep, x_light_clean, x_deep_clean] = generate_eeg(p);

% Plot Step 1 signals
plot_step1_results(t, x_light_clean, x_light, x_deep_clean, x_deep);

% High-pass filter
[y_light_hp, H_hp] = highpass_filter(x_light, t, p);
[y_deep_hp,  ~]    = highpass_filter(x_deep, t, p);
plot_filter_stage(t, x_light, y_light_hp, x_deep, y_deep_hp, 'High-Pass Filter');
plot_bode_response(H_hp, 'High-Pass Filter Bode Plot');

% Low-pass filter
[y_light_lp, H_lp] = lowpass_filter(y_light_hp, t, p);
[y_deep_lp,  ~]    = lowpass_filter(y_deep_hp, t, p);
plot_filter_stage(t, y_light_hp, y_light_lp, y_deep_hp, y_deep_lp, 'Low-Pass Filter');
plot_bode_response(H_lp, 'Low-Pass Filter Bode Plot');

% Notch filter
[y_light_notch, H_notch] = notch_filter(y_light_lp, t, p);
[y_deep_notch,  ~]       = notch_filter(y_deep_lp, t, p);
plot_filter_stage(t, y_light_lp, y_light_notch, y_deep_lp, y_deep_notch, '50 Hz Notch Filter');
plot_bode_response(H_notch, '50 Hz Notch Filter Bode Plot');

% RMS detection
y_light_rms = rms_detector(y_light_notch, p);
y_deep_rms  = rms_detector(y_deep_notch, p);

plot_rms_results(t, y_light_rms, y_deep_rms);

% Print simple summary values
mean_rms_light = mean(y_light_rms);
mean_rms_deep  = mean(y_deep_rms);

fprintf('Mean RMS for Light Anesthesia EEG: %.4f\n', mean_rms_light);
fprintf('Mean RMS for Deep Anesthesia EEG : %.4f\n', mean_rms_deep);