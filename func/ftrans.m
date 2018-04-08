function [f, F] = ftrans(data, Fs, N)
% 返回幅频响应，f为频率，F为幅度

F = fft(data, N); % FFT
FF = abs(F);
FF = FF / max(FF); % FFT单位化
f = Fs * (0:N/16) / N; % 输出的频率轴
plot(f,FF(1:N/16+1));
F = FF(1:N/16+1); % 对应的幅度轴

end