function y_rms = rms_detector(x, p)

    N = round(p.rms_window_sec * p.Fs);

    if N < 1
        N = 1;
    end

    y_rms = sqrt(movmean(x.^2, N));

end