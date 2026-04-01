function plot_bode_response(H, plot_title)

    figure('Name', plot_title, 'NumberTitle', 'off');
    bode(H);
    grid on;
    title(plot_title);

end