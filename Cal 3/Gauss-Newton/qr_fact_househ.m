function [Q,R] = qr_fact_househ(A)

[row, col] = size(A);
n = size(A,1);
I = eye(n);
%Q is the identity matirx first
Q = I;
R = A;
for j = 1:col
    %get x
    x = R(j:n,j);
    %get norm of x
    sx = size(x,1);
    tx = 0;
    for ww = 1:sx
        tx = tx + x(ww)^2;
    end
    nx = sqrt(tx);
    
    %get v
    v = nx * eye(n-j+1,1) + x;
    
    %norm of v
    sv = size(v,1);
    tv = 0;
    for ww = 1:sv
        tv = tv + v(ww)^2;
    end
    nv = sqrt(tv);
    
    if nv>0,
        v=v/nv;
        P=I;
        %get H
        P(j:n,j:n) = P(j:n,j:n) - 2 * (v)*(v');
        %Q = H1*H2*....Hn
        Q = Q*P;
        %R = H1*H2*...Hn*A
        R = P*R;
    end
end