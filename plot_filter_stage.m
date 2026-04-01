function plot_filter_stage(t, x_in_light, x_out_light, x_in_deep, x_out_deep, stage_name)

    figure('Name', stage_name, 'NumberTitle', 'off');

    subplot(2,2,1);
    plot(t, x_in_light, 'b');
    title(['Light EEG Before ', stage_name]);
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    xlim([0 5]);

    subplot(2,2,2);
    plot(t, x_out_light, 'b');
    title(['Light EEG After ', stage_name]);
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    xlim([0 5]);

    subplot(2,2,3);
    plot(t, x_in_deep, 'r');
    title(['Deep EEG Before ', stage_name]);
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    xlim([0 5]);

    subplot(2,2,4);
    plot(t, x_out_deep, 'r');
    title(['Deep EEG After ', stage_name]);
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    xlim([0 5]);

end