function out = exchange_track(in)
out = in;
out(:, 1) = in(:, 2);
out(:, 2) = in(:, 1);
end

