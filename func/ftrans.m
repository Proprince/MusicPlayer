function [f, F] = ftrans(data, Fs, N)
% ���ط�Ƶ��Ӧ��fΪƵ�ʣ�FΪ����

F = fft(data, N); % FFT
FF = abs(F);
FF = FF / max(FF); % FFT��λ��
f = Fs * (0:N/16) / N; % �����Ƶ����
plot(f,FF(1:N/16+1));
F = FF(1:N/16+1); % ��Ӧ�ķ�����

end