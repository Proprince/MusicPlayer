% ����
%   spPitchCorr - Pitch Estimation via Auto-correlation Method
% �÷�
%   [f0] = spPitchCorr(r, fs)
% ����
%   ��������صĻ������ڼ��
% ����
%   r        �����ϵ��������(maxlag*2+1)x1
%   fs       ԭʼ�źŵĲ���Ƶ��
% OUTPUTS
%   f0       ���ƵĻ���
function [f0] = spPitchCorr(r, fs)
 % ��2ms (=500Hz)��20ms (=50Hz)�ڵ����ֵ
 ms2=floor(fs/500); % 2ms
 ms20=floor(fs/50); % 20ms
 % ��Ӧ��ʵ�ź�
 r = r(floor(length(r)/2):end);
 [maxi,idx]=max(r(ms2:ms20));
 f0 = fs/(ms2+idx-1);
end