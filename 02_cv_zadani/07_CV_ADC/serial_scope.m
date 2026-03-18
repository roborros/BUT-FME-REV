clear all;
port = "COM3";
baud = 115200;
useDTR = true;
window_s = 10;

s = serialport(port, baud);
configureTerminator(s, "CR");
flush(s);

if useDTR
    setDTR(s, true);
end

x = [];
y = [];
t0 = tic;

figure;
h = plot(nan, nan);
grid on;
xlabel("Time [s]");
ylabel("Value");
title("Serial data");

while ishandle(h)
    str = readline(s);
    val = str2double(str);

    if ~isnan(val)
        t = toc(t0);

        x(end+1) = t;
        y(end+1) = val;

        idx = x >= (t - window_s);
        x = x(idx);
        y = y(idx);

        set(h, "XData", x, "YData", y);
        xlim([max(0, t - window_s), max(window_s, t)]);
        drawnow limitrate;
    end
end