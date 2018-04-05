function [OE, out] = record(Fs, bits, tracks, sec)

ar = audiorecorder(Fs, bits, tracks);
%disp('Start speaking.');
recordblocking(ar, sec); % ¼sec��
%disp('End of Recording.');

data = getaudiodata(ar); % doubles

% load './music/7.mat'
% data = music;

% data = audioread('./music/guitar.wav');
% data = data(:,1)';
% data = data(1:1.87e6);

data = unit(data);
% plot(data);
% hold on;

th = 0.5; frame = 128; % ÿ֡���ȣ���������
now = false; begin = 0;
out = []; OE = false;
last = (floor(length(data)/frame)-2)*frame;

for i = 1:frame:last,
    temp = data(i:i+2*frame);
    eng = sum(temp .^ 2); % ������ʽ
    if ~now && eng > th, % δ��Ч��������������ֵ
        now = ~now;
        begin = i;
    elseif now && (eng < th || i >= last-1),
    % ����Ч����С����ֵ����Ƶ�ļ������ˣ���������ݲɼ�
        if i - begin > 8000,
%             plot([begin,begin],[-1,1]);
%             plot([i,i],[-1,1]);
            out = data(begin:i);
            OE = true;
            return;
        else % �������������Ч
            now = ~now;
        end
    end
end

end

