function gender = find_gender(wav, Fs)
wav = wav(:, 1);
N = 2048*8;
[f, F] = ftrans(wav, Fs, N);
[~, i] = max(F);
frec = f(i);
if frec > 100
    gender = true;
else
    gender = false;
end
end

