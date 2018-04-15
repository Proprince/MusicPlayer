% 名称
%   spPitchTrackCorr:基于自相关的基音周期检测
% 使用
%   [F0, T, R] = 
%     spPitchTrackCorr(x, fs, frame_length, frame_overlap, maxlag, show)
% 面述
%   在时域跟踪 F0变化
% 输入
%   x               大小Nx1.
%   fs              采样率，单位Hz. 
%   [frame_length]  声音片段长度，默认30（ms） 
%   [frame_overlap] 声音片段重叠部分，默认重叠长度的一半。 
%   [maxlag]        求滞后区间[-maxlag:maxlag]. 默认20ms（Hz）延后，(最小人声). 
%   [show]          是否绘画，默认为0.
% 输出
%   F0              1*k 包含基本频率，K 是声音片段数量。
%   T               1*k,每个声音片段中间的值
%   [R]             M*K包含相关信息
function [F0, T, R] = spPitchTrackCorr(x, fs, frame_length, frame_overlap, maxlag, show)
 %% 初始化
 N = length(x);
 if ~exist('frame_length', 'var') || isempty(frame_length)
     frame_length = 30;
 end
 if ~exist('frame_overlap', 'var') || isempty(frame_overlap)
     frame_overlap = 20;
 end
 if ~exist('maxlag', 'var')
     maxlag = [];
 end
 if ~exist('show', 'var') || isempty(show)
     show = 0;
 end 
 nsample = round(frame_length  * fs / 1000); % 转换 ms 到 point
 noverlap = round(frame_overlap * fs / 1000); % 转换 ms 到 point

 %% 基音监测
 pos = 1; i = 1;
 while (pos+nsample < N)
     frame = x(pos:pos+nsample-1);
     frame = frame - mean(frame); % 去除中值
     R(:,i) = spCorrelum(frame, fs);
     F0(i) = spPitchCorr(R(:,i), fs);
     if sum(abs(frame)) < 30
         F0(i) = 0;
     end
     pos = pos + (nsample - noverlap);
     i = i + 1;
 end
 T = (round(nsample/2):(nsample-noverlap):N-1-round(nsample/2))/fs;

if show 
    % 画出波形
    subplot(2,1,1);
    t = (0:N-1)/fs;
    plot(t, x);
    legend('Waveform');
    xlabel('Time (s)');
    ylabel('Amplitude');
    xlim([t(1) t(end)]);

    % 画出 F0跟踪
    subplot(2,1,2);
    plot(T,F0);
    legend('pitch track');
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    xlim([t(1) t(end)]);
end