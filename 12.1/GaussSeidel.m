function x = GaussSeidel(A,b,es,maxit)
% input:
%   A = 정사각행렬
%   b = 우변벡터
%   es = 종료기준 오차 (default = 0.00001%)
%   maxit = 최대 반복 횟수 (default = 50)
% output:
%   x = 해

if nargin<2,error('at least 2 input arguments required'),end
if nargin<4||isempty(maxit),maxit=50;end
if nargin<3||isempty(es),es=0.00001;end
% 입력은 2개 이상이여야 한다. (A행렬과 우변벡터)
% es는 종료기준 오차로 입력하지 않을 시 0.00001로 초기화
% maxit는 반복횟수로 입력하지 않을 시 50으로 초기화

[m,n] = size(A);    % m,n은 A행렬의 크기
if m~=n, error('Matrix A must be square'); end % A는 정사각행렬이어야 한다.
C = A;

for i = 1:n
  C(i,i) = 0;
  x(i) = 0;
end
% C와 x의 모든 원소를 0으로 초기화 ( 초기값 0 )

x = x';
for i = 1:n
  C(i,1:n) = C(i,1:n)/A(i,i);
end
for i = 1:n
  d(i) = b(i)/A(i,i);
end
% 3x3 연립방정식의 해를 구하기 위해 변형된 식을 적용하여
% 초기값 0으로 부터 첫번째 해를 구한다.

iter = 0;
while (1)
  xold = x;
  for i = 1:n
    x(i) = d(i)-C(i,:)*x;
    if x(i) ~= 0
      ea(i) = abs((x(i) - xold(i))/x(i)) * 100;
    end
  end
  % 첫번째로 구해진 해로 부터 종료기준오차 또는 최대반복횟수를 만족할 때까지
  % 변형된 식에 이전에 구한 해를 대입하여 해를 구한다.
  
  iter = iter+1;    % 반복횟수 증가
  if max(ea)<=es || iter >= maxit, break, end % 종료기준
end
