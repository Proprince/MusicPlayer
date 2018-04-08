function out = reverse_wav(in)
out = in;
len = size(in, 1); %¾ØÕóµÄĞĞÊı
out(:, :) = in(len:-1:1, :);
end

