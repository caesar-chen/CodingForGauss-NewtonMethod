

filename = input('Enter a file name: ', 's');
fileID = fopen(filename);
formatSpec = '%f';
A = fscanf(fileID,formatSpec,[2 Inf]);
A = A';
fclose(fileID);

guess = 'Enter the initial guess for a, b, c as coordinates of beta, in format as [a, b, c]: ';
beta = input(guess);
beta = beta';

itr = 'Enter the number of iterations: ';
N = input(itr);

%J
J = eye(size(A,1),3);
%r
r = eye(size(A,1),1);

for k = 1:N
    for i = 1:3
        for j = 1:size(A,1)
            r(j) = A(j,2) - (((beta(1)*(A(j,1)))/(beta(2)+(A(j,1)))) + beta(3));
            if i == 1
                J(j,1) = -(A(j,1))/((A(j,1)) + beta(2));
            end
            if i == 2
                J(j,2) = (beta(1)*(A(j,1)))/((beta(2)+(A(j,1)))^2);
            end
            if i == 3
                J(j,3) = -1;
            end
        end
    end
    [Q,R] = qr_fact_househ(J);
    R = R(1:3,1:3);
    Q = Q(:,1:3);
    x = [0,0,0]';
    y = (Q')*r;
    x(3) = y(3)/(R(3,3));
    x(2) = (y(2)-x(3)*R(2,3))/(R(2,2));
    x(1) = (y(1)-x(3)*R(1,3)-x(2)*R(1,2))/(R(1,1));
    beta = beta - x;
end
disp(beta);