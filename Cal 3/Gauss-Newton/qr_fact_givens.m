function [ Q, R ] = qr_fact_givens( A )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[row, col] = size(A);
R = A;
Q = eye(row, col);

for c = 1 : (col - 1)
    for r = (c+1) : row
       if R(r, c) ~= 0
           G = eye(row, col);
           x = R(c, c);
           y = R(r, c);
           
           cos = x / sqrt(x * x + y * y);
           sin = - y / sqrt(x * x + y * y);
           G(c, c) = cos;
           G(c, r) = -sin;
           G(r, c) = sin;
           G(r, r) = cos;
           R = G * R;
           Q = Q * transpose(G);
       end
    end
end


end

