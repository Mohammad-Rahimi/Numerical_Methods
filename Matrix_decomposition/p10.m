A = [15 -18 15 -3; -18 24 -18 4; 15 -18 18 -3;-3 4 -3 1];
b=chol(A)
L1=cholesky(A)
L1*L1'
b'*b
L1'*L1
A

%%%%%%%%%
function [ A ] = cholesky( A )
   
n = length(A);
for i = 1:n
    for k = 1:i-1
       A(i,i) = A(i,i) - A(k,i)*A(k,i); 
    end
    A(i,i) = sqrt(A(i,i));
    
    for j = i+1:n
        for k = 1:i-1;
            A(i,j)= A(i,j) - A(k,i)*A(k,j);
        end
        A(i,j) = A(i,j)/A(i,i);
    end
end
   A = triu(A); % get upper triangular part of matrix
   
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function L = ccholesky(A)
% Cholesky Decomposition
%
% Input:
% A - Symmetric, positive definite matrix
%
% Output:
% L - Lower triangular matrix such that A = L*L'

[n, n] = size(A);
L = zeros(n, n);

for i = 1:n
    for k = 1:i-1
        sum = A(i,k)*L(k,k);
        for j = 1:k-1
            sum = sum - L(i,j)*L(k,j);
        end
        L(i,k) = (A(i,k) - sum)/L(k,k);
    end
    sum = A(i,i);
    for j = 1:i-1
        sum = sum - L(i,j)^2;
    end
    L(i,i) = sqrt(sum);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function A=Ccholesky(A)
[n m]=size(A);
for k=1:n
    A(k,k)=sqrt(A(k,k));
    A(k+1:n,k)=A(k+1:n,k)/A(k,k);
    for j=k+1:n
        A(j:n,j)=A(j:n,j)-A(j,k)*A(j:n,k);
    end
for k=2:n
    for j=1:k-1
    A(k,j)=0;
    end
end
end
end
