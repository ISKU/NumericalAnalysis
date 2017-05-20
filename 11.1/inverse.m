function [L, U, inverse, d1, d2, d3] = inverse(A)
% input:
%   A = 정사각행렬
% output:
%   L = A에서 분리된 하삼각행렬
%   U = A에서 분리된 상삼각행렬
%   inverse = A의 역행렬

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
d1 = zeros(n, 1);   
d2 = zeros(n, 1);  
d3 = zeros(n, 1);

b1 = [1; 0; 0]; % 역행렬의 첫번째
b2 = [0; 1; 0]; % 역행렬의 두번째
b3 = [0; 0; 1]; % 역행렬의 세번째 열을 구하기 위한 우변 벡터
for i = 1:n
    d1(i) = b1(i) - L(i, 1:i-1)*d1(1:i-1);
    d2(i) = b2(i) - L(i, 1:i-1)*d2(1:i-1);
    d3(i) = b3(i) - L(i, 1:i-1)*d3(1:i-1);
    % 하상감행렬에서 얻어지는 d를 구하는 과정이다.
end

% 후진 대입
Aug1 = [U d1];
Aug2 = [U d2];
Aug3 = [U d3]; % 상삼각행렬과 d를 조합한다
x1 = zeros(n, 1); % 역행렬의 첫번째
x2 = zeros(n, 1); % 역행렬의 두번째
x3 = zeros(n, 1); % 역행렬의 세번째 열

x1(n) = Aug1(n, n+1) / Aug1(n,n);  % x의 마지막 해를 구함
x2(n) = Aug2(n, n+1) / Aug2(n,n);
x3(n) = Aug3(n, n+1) / Aug3(n,n);
for i = n-1:-1:1
    x1(i) = (Aug1(i, n+1) - Aug1(i, i+1:n)*x1(i+1:n))/Aug1(i,i);
    x2(i) = (Aug2(i, n+1) - Aug2(i, i+1:n)*x2(i+1:n))/Aug2(i,i);
    x3(i) = (Aug3(i, n+1) - Aug3(i, i+1:n)*x3(i+1:n))/Aug3(i,i);
    % 바로 직전에서 구한 해들을 이용하여 대입법을 통해 해당 행의 해를 구하는 과정
end

inverse = [x1 x2 x3];   % 각각의 역행렬의 열의 해를 구한 것을 합친다.