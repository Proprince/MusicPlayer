% 名称
%   spPitchCorr - Pitch Estimation via Auto-correlation Method
% 用法
%   [f0] = spPitchCorr(r, fs)
% 面述
%   基于自相关的基音周期检测
% 输入
%   r        自相关系数，长度(maxlag*2+1)x1
%   fs       原始信号的采样频率
% OUTPUTS
%   f0       估计的基音
function [f0] = spPitchCorr(r, fs)
 % 搜2ms (=500Hz)到20ms (=50Hz)内的最大值
 ms2=floor(fs/500); % 2ms
 ms20=floor(fs/50); % 20ms
 % 反应真实信号
 r = r(floor(length(r)/2):end);
 [maxi,idx]=max(r(ms2:ms20));
 f0 = fs/(ms2+idx-1);
end