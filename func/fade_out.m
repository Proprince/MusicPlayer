function out = fade_out(in, percent)
out = in;
len = floor(percent * size(in, 1));
start = size(in, 1) - len + 1;
out(start:end, :) = out(start:end, :) .* (repmat((len:-1:1)', 1, size(in, 2)) / len);
end

