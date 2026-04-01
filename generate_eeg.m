function [t, x_light, x_deep, x_light_clean, x_deep_clean] = generate_eeg(p)

    t = 0:1/p.Fs:p.T-1/p.Fs;

    rng('shuffle');
    phi = 2*pi*rand(1,12);

    % Light anesthesia frequencies
    f_delta_light = [2.0, 3.0];
    f_theta_light = [5.5, 6.5];
    f_alpha_light = [9.5, 10.5, 12.0];
    f_beta_light  = [18.0, 22.0, 26.0];

    % Deep anesthesia frequencies
    f_delta_deep = [1.0, 2.0, 3.0];
    f_theta_deep = [5.0, 6.0];
    f_alpha_deep = [9.0];
    f_beta_deep  = [18.0];

    % Light anesthesia amplitudes
    A_delta_light = [6, 5];
    A_theta_light = [5, 4];
    A_alpha_light = [10, 9, 8];
    A_beta_light  = [7, 6, 5];

    % Deep anesthesia amplitudes
    A_delta_deep = [14, 12, 10];
    A_theta_deep = [6, 5];
    A_alpha_deep = [3];
    A_beta_deep  = [2];

    % Build clean light EEG
    x_light_clean = zeros(size(t));
    k = 1;

    for i = 1:length(f_delta_light)
        x_light_clean = x_light_clean + A_delta_light(i)*cos(2*pi*f_delta_light(i)*t + phi(k));
        k = k + 1;
    end

    for i = 1:length(f_theta_light)
        x_light_clean = x_light_clean + A_theta_light(i)*cos(2*pi*f_theta_light(i)*t + phi(k));
        k = k + 1;
    end

    for i = 1:length(f_alpha_light)
        x_light_clean = x_light_clean + A_alpha_light(i)*cos(2*pi*f_alpha_light(i)*t + phi(k));
        k = k + 1;
    end

    for i = 1:length(f_beta_light)
        x_light_clean = x_light_clean + A_beta_light(i)*cos(2*pi*f_beta_light(i)*t + phi(k));
        k = k + 1;
    end

    % Build clean deep EEG
    x_deep_clean = zeros(size(t));
    k = 1;

    for i = 1:length(f_delta_deep)
        x_deep_clean = x_deep_clean + A_delta_deep(i)*cos(2*pi*f_delta_deep(i)*t + phi(k));
        k = k + 1;
    end

    for i = 1:length(f_theta_deep)
        x_deep_clean = x_deep_clean + A_theta_deep(i)*cos(2*pi*f_theta_deep(i)*t + phi(k));
        k = k + 1;
    end

    for i = 1:length(f_alpha_deep)
        x_deep_clean = x_deep_clean + A_alpha_deep(i)*cos(2*pi*f_alpha_deep(i)*t + phi(k));
        k = k + 1;
    end

    for i = 1:length(f_beta_deep)
        x_deep_clean = x_deep_clean + A_beta_deep(i)*cos(2*pi*f_beta_deep(i)*t + phi(k));
        k = k + 1;
    end

    % Slow amplitude modulation to make signals less artificial
    env_light = 1 + 0.15*cos(2*pi*0.2*t);
    env_deep  = 1 + 0.20*cos(2*pi*0.15*t);

    x_light_clean = x_light_clean .* env_light;
    x_deep_clean  = x_deep_clean  .* env_deep;

    % 50 Hz interference
    powerline_noise = p.interference_amp * cos(2*pi*p.f_notch*t);

    % Random noise
    random_noise_light = p.noise_level * randn(size(t));
    random_noise_deep  = p.noise_level * randn(size(t));

    % Final noisy signals
    x_light = x_light_clean + powerline_noise + random_noise_light;
    x_deep  = x_deep_clean  + powerline_noise + random_noise_deep;

end