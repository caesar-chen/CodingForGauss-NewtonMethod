dt = zeros(1000, 1); %determinant
itr = zeros(1000, 1); % number of iteration of A
itr_i = zeros(1000, 1); %number of iteration of inverse of A
tr = zeros(1000, 1); %trace
eig_l = zeros(1000, 1); %eigenvalue of A
eig_s = zeros(1000, 1); %eigenvalue of inverse of A

for i = 1:1000
    A = 4 * rand(2) - 2;
    d = (A(1, 1) * A(2, 2) - A(1, 2) * A(2, 1));
    dt(i, 1) = d;
    tr(i, 1) = sum(diag(A));
    
    [val1,itr1] = power_method(A, [1; 0], 0.00005, 100);
    eig_l(i, 1) = abs(val1);
    itr(i, 1) = itr1;
    inv_A = [1 0; 0 1] / A;
    [val2,itr2] = power_method(inv_A, [1;0], 0.00005, 100);
    eig_s(i, 1) = abs(1 / val2);
    itr_i(i, 1) = itr2;
end;
scatter(dt, tr, [], itr)
xlabel('Determinant')
ylabel('Trace')

pause
scatter(dt, tr, [], itr_i)
xlabel('Determinant')
ylabel('Trace')
