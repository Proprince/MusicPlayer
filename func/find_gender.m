function gender = find_gender(wav, Fs)
addpath(genpath(pwd));
wav = wav(:, 1);
[F0, ~, ~] = spPitchTrackCorr(wav, Fs, 30, 20, []);
frec = median(F0(F0 ~= 0));
if frec > 200
    gender = true;
else
    gender = false;
end
end

