function [U, Ut, x] = cholesky(A)
% input:
%   A = 정사각행렬
% output:
%   U = 상삼각행렬
%   Ut = U의 Transpose행렬
%   x = 해


[m,n] = size(A);    % m n 은 행렬 A의 크기
if m~=n, error('Matrix A must be square'); end % A는 정사각 행렬이어야 한다.

for i = 1:n
  s = 0;
  for k = 1:i-1
    s = s + U(k, i) ^ 2;    
  end
  U(i, i) = sqrt(A(i, i) - s);  % U11, U22, U33을 구함
  for j = i + 1:n
    s = 0;
    for k = 1:i-1
      s = s + U(k, i) * U(k, j); 
    end
    U(i, j) = (A(i, j) - s) / U(i, i);     % U12, U13, U23을 구함
  end
end
% U' * U = X를 만족하는 상삼각행렬 U를 구하는 과정

b = [sum(A(1,:)); sum(A(2,:)); sum(A(3,:))];
% 각각의 행에 해당하는 원소의 합으로 우변 벡터의 행의 값이 정해짐

for i = 1:n
    for j = 1:n
        Ut(i, j) = U(j, i);
    end
end
% U의 Transpose행렬 Ut를 행과 열의 위치를 바꾸어 구한다.

d = Ut\b;   % Ut와 우변벡터 b로부터 d의 해를 구한다.
x = U\d;    % U와 d로부터 최종적으로 x의 해를 구함.



