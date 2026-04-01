function p = parameters()
    p.Fs = 500;                 % Sampling frequency in Hz
    p.T = 10;                   % Duration in seconds

    p.fc_hp = 0.5;              % High-pass cutoff in Hz
    p.fc_lp = 30;               % Low-pass cutoff in Hz
    p.f_notch = 50;             % Notch frequency in Hz
    p.Q_notch = 10;             % Notch quality factor

    p.noise_level = 5;          % Random noise amplitude
    p.interference_amp = 8;     % 50 Hz interference amplitude

    p.rms_window_sec = 1;       % RMS window length in seconds
end