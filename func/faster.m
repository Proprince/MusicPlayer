function out = faster(in, rate)
out_len = round((length(in) - 1) / rate) + 1;
out = zeros(out_len, size(in, 2));
for i = 2:(out_len - 1)
    i_ = (i - 1) * rate + 1;
    x1 = floor(i_);
    x2 = x1 + 1;
    out(i, :) = (in(x2, :) - in(x1, :)) * (i_ - x1) + in(x1, :);
end
out(1, :) = in(1, :);
out(end, :) = in(end, :);
end

