function [ value, itr ] = power_method( A, v, toler, N )
% Summary of this function goes here
%   Detailed explanation goes here
norm_back = 0;

for i = 1 : numel(v)
    norm_back = norm_back + v(i, 1)*v(i, 1);
end

norm_back = sqrt(norm_back);
x_back = v / norm_back;

for i = 1 : N
    x = A * x_back;
    normX = 0;
    for j = 1 : numel(x)
        normX = normX + x(j, 1) * x(j, 1);
    end
    normX = sqrt(normX);
    x=x / normX;
    diff = abs(normX - norm_back);
    if diff < toler
        break
    end
    x_back = x;
    norm_back = normX;
end;

value = normX;
itr = i;
end