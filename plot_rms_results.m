function plot_rms_results(t, y_light_rms, y_deep_rms)

    figure('Name', 'RMS Output', 'NumberTitle', 'off');

    subplot(2,1,1);
    plot(t, y_light_rms, 'b');
    title('RMS Output for Light Anesthesia EEG');
    xlabel('Time (s)');
    ylabel('RMS Amplitude');
    grid on;
    xlim([0 5]);

    subplot(2,1,2);
    plot(t, y_deep_rms, 'r');
    title('RMS Output for Deep Anesthesia EEG');
    xlabel('Time (s)');
    ylabel('RMS Amplitude');
    grid on;
    xlim([0 5]);

end