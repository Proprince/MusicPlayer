function out = merge_wav(in1, in2) %�����ϲ�
if size(in1, 2) ~= size(in2, 2)
    return
end
len1 = size(in1, 1);
len2 = size(in2, 1);
if len1 > len2
    in2 = [in2; zeros(len1 - len2, size(in1, 2))];
elseif len1 < len2
    in1 = [in1; zeros(len2 - len1, size(in1, 2))];
end
out = in1 + in2;
end

