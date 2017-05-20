function [L, U, d, x] = LUNaive(A, b)
% input:
%   A = 동일한 계수를 갖는 행렬
%   b = 우변 상수 벡터
% output:
%   L = A에서 분리된 하삼각행렬
%   U = A에서 분리된 상삼각행렬
%   d = 하삼각행렬에서 얻은 우변 벡터
%   x = 해

[m,n] = size(A);    % A행렬의 크기를 m, n에 초기화
if m~=n, error('Matrix A must be square'); end % m과 n은 같은 크기의 행렬
L = eye(n); % n만큼의 단위 행렬
U = A;  % U를 A로 초기화, A에서 소거과정을 거쳐 상삼각행렬이 된다.

% 전진소거
for k = 1:n-1
  for i = k+1:n
    L(i,k) = U(i,k)/U(k,k);
    % 피봇과 소거될 항의 나눗셈 연산을 하삼각행렬에 저장한다.
    U(i,k) = 0; % 제거되는 항을 0으로 초기화
    U(i,k+1:n) = U(i,k+1:n)-L(i,k)*U(k,k+1:n);
    % 나머지 항들에 대해 소거 연산 과정
  end
end

% 전진 대입
d = zeros(n, 1);    
for i = 1:n
    d(i) = b(i) - L(i, 1:i-1)*d(1:i-1);
    % 하상감행렬에서 얻어지는 d를 구하는 과정이다.
end

% 후진 대입
Aug = [U d];    % 상삼각행렬과 d를 조합한다
x = zeros(n, 1);    
x(n) = Aug(n, n+1) / Aug(n,n);  % x의 마지막 해를 구함
for i = n-1:-1:1
    x(i) = (Aug(i, n+1) - Aug(i, i+1:n)*x(i+1:n))/Aug(i,i);
    % 바로 직전에서 구한 해들을 이용하여 대입법을 통해 해당 행의 해를 구하는 과정
end