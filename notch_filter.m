function [y, H_notch] = notch_filter(x, t, p)

    s = tf('s');
    w0 = 2*pi*p.f_notch;
    Q  = p.Q_notch;

    H_notch = (s^2 + w0^2) / (s^2 + (w0/Q)*s + w0^2);
    y = lsim(H_notch, x, t);

end