function [L, U] = LUNaive(A)
% LUNaive(A):
%   LU decomposition without pivoting.
% input:
%   A = coefficient matrix
% output:
%   L = lower triangular matrix
%   U = upper triangular matrix

[m,n] = size(A);
if m~=n, error('Matrix A must be square'); end
L = eye(n);
U = A;
% forward elimination
for k = 1:n-1
  for i = k+1:n
    L(i,k) = U(i,k)/U(k,k);
    U(i,k) = 0;
    U(i,k+1:n) = U(i,k+1:n)-L(i,k)*U(k,k+1:n);
  end
end





