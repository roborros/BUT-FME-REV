num_points = 255;  % delka   
max_value = 1023;  % rozsah    
array_name = 'waveform_lut';

% generator funkce
t = linspace(0, 2*pi, num_points + 1);
t(end) = [];
raw_signal = sin(7*t) .* sin(t*0.5);
plot(t, raw_signal)

% Normalizace 0..1
signal_min = min(raw_signal);
signal_max = max(raw_signal);
normalized_signal = (raw_signal - signal_min) / (signal_max - signal_min);

% Uprava na rozsah
final_signal = round(normalized_signal * max_value);

fprintf('const uint16_t %s[%d] = {\n    ', array_name, num_points);

for i = 1:num_points
    if mod(i, 16) == 0
        fprintf('%d,\n    ', final_signal(i));
    elseif i == num_points
        fprintf('%d\n', final_signal(i));
    else
        fprintf('%d, ', final_signal(i));
    end
end

fprintf('};\n');