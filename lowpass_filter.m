function [y, H_lp] = lowpass_filter(x, t, p)

    s = tf('s');
    wc = 2*pi*p.fc_lp;

    H_lp = wc / (s + wc);
    y = lsim(H_lp, x, t);

end