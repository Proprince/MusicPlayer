function [player, data] = record(Fs, bits, tracks, sec)

player = audiorecorder(Fs, bits, tracks);
recordblocking(player, sec); % ¼sec��

data = getaudiodata(player); % doubles

end

