% ����
%   spCorrelum - �źŵ������ϵ��
% �÷�
%   [r] = spCorrelum(x, fs, maxlag, show)
% ����
%   ����źŵ������ϵ��
% ����
%   x        N*1�������������������ź�
%   fs       ����Ƶ��
%   [maxlag] ��һ���ͺ�Χ�ڣ���������У���Χ��[-maxlag:maxlag]����� r �ĳ�����2*maxlag+1��Ĭ��20ms
%            ��ʱ����50Hz��������������СƵ�ʡ�
% ���
%   r        ���ϵ��������2*maxlag+1�� 
% ʹ��
%   xcorr.m (Signal Processing toolbox)
function [r] = spCorrelum(x, fs, maxlag, show)
 %% ��ʼ��
 if ~exist('maxlag', 'var') || isempty(maxlag)
     maxlag = round(fs/50); % F0 is greater than 50Hz => 20ms maxlag
 end
 if ~exist('show', 'var') || isempty(show)
     show = 0;
 end

 %% �����
 r = xcorr(x, maxlag, 'coeff');

 if show
     %% ������ͼ
     t=(0:length(x)-1)/fs;        % ����Ƭ��ʱ��
     subplot(2,1,1);
     plot(t,x);
     legend('Waveform');
     xlabel('Time (s)');
     ylabel('Amplitude');
     xlim([t(1) t(end)]);

     %% �������
     d=(-maxlag:maxlag)/fs;
     subplot(2,1,2);
     plot(d,r);
     legend('Auto-correlation');
     xlabel('Lag (s)');
     ylabel('Correlation coef');
 end
end