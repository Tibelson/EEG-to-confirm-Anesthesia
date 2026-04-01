function [y, H_hp] = highpass_filter(x, t, p)

    s = tf('s');
    wc = 2*pi*p.fc_hp;

    H_hp = s / (s + wc);
    y = lsim(H_hp, x, t);

end