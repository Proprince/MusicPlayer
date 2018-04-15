function out = filter_wav(in, Fs)
[b,a] = ellip(8,0.05,80,[150 4000]*2/Fs);
out = filter(b,a,in);
end

