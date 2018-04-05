function out = reverse_wav(in)
out = in;
len = size(in, 1);
out(:, :) = in(len:-1:1, :);
end

