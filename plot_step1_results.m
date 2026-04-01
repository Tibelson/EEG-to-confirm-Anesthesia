function plot_step1_results(t, x_light_clean, x_light, x_deep_clean, x_deep)

    figure('Name', 'Step 1 EEG Signals', 'NumberTitle', 'off');

    subplot(2,2,1);
    plot(t, x_light_clean, 'b');
    title('Clean Light EEG');
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    xlim([0 5]);

    subplot(2,2,2);
    plot(t, x_light, 'b');
    title('Noisy Light EEG');
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    xlim([0 5]);

    subplot(2,2,3);
    plot(t, x_deep_clean, 'r');
    title('Clean Deep EEG');
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    xlim([0 5]);

    subplot(2,2,4);
    plot(t, x_deep, 'r');
    title('Noisy Deep EEG');
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    xlim([0 5]);

end