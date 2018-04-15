% 名称
%   spCorrelum - 信号的自相关系数
% 用法
%   [r] = spCorrelum(x, fs, maxlag, show)
% 面述
%   获得信号的自相关系数
% 输入
%   x        N*1的向量用于容纳声音信号
%   fs       采样频率
%   [maxlag] 在一定滞后范围内，求相关序列，范围是[-maxlag:maxlag]。输出 r 的长度是2*maxlag+1。默认20ms
%            延时，即50Hz，这是人声的最小频率。
% 输出
%   r        相关系数，长度2*maxlag+1。 
% 使用
%   xcorr.m (Signal Processing toolbox)
function [r] = spCorrelum(x, fs, maxlag, show)
 %% 初始化
 if ~exist('maxlag', 'var') || isempty(maxlag)
     maxlag = round(fs/50); % F0 is greater than 50Hz => 20ms maxlag
 end
 if ~exist('show', 'var') || isempty(show)
     show = 0;
 end

 %% 自相关
 r = xcorr(x, maxlag, 'coeff');

 if show
     %% 画波形图
     t=(0:length(x)-1)/fs;        % 声音片段时间
     subplot(2,1,1);
     plot(t,x);
     legend('Waveform');
     xlabel('Time (s)');
     ylabel('Amplitude');
     xlim([t(1) t(end)]);

     %% 画自相关
     d=(-maxlag:maxlag)/fs;
     subplot(2,1,2);
     plot(d,r);
     legend('Auto-correlation');
     xlabel('Lag (s)');
     ylabel('Correlation coef');
 end
end