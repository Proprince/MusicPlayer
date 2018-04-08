function out = echo_wav(in) %Ê²Ã´¶«Î÷
w1 = [in; zeros(10000, size(in, 2))];
w2 = [zeros(10000, size(in, 2)); in];
out = (w1 + w2) / 2;
end