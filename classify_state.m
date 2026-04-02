function [label, led_green, led_red] = classify_state(y_rms, threshold)

    value = mean(y_rms);

    if value >= threshold
        label = "Deep Anesthesia";
        led_green = 0;
        led_red = 1;
    else
        label = "Light Anesthesia";
        led_green = 1;
        led_red = 0;
    end
end