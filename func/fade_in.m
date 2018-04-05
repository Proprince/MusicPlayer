function out = fade_in(in, percent)
out = in;
len = floor(percent * size(in, 1));
out(1:len, :) = out(1:len, :) .* (repmat((1:len)', 1, size(in, 2)) / len);
end

