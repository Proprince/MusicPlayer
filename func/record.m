function [OE, out] = record(Fs, bits, tracks, sec)

ar = audiorecorder(Fs, bits, tracks);
%disp('Start speaking.');
recordblocking(ar, sec); % 录sec秒
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

th = 0.5; frame = 128; % 每帧长度，计算能量
now = false; begin = 0;
out = []; OE = false;
last = (floor(length(data)/frame)-2)*frame;

for i = 1:frame:last,
    temp = data(i:i+2*frame);
    eng = sum(temp .^ 2); % 能量公式
    if ~now && eng > th, % 未有效并且能量大于阈值
        now = ~now;
        begin = i;
    elseif now && (eng < th || i >= last-1),
    % 已有效，且小于阈值或音频文件结束了，则完成数据采集
        if i - begin > 8000,
%             plot([begin,begin],[-1,1]);
%             plot([i,i],[-1,1]);
            out = data(begin:i);
            OE = true;
            return;
        else % 否则这段数据无效
            now = ~now;
        end
    end
end

end

