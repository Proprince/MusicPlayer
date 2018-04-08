function [player, data] = record(Fs, bits, tracks, sec)

player = audiorecorder(Fs, bits, tracks);
recordblocking(player, sec); % Â¼secÃë

data = getaudiodata(player); % doubles

end

