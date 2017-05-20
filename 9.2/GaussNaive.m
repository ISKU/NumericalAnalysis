function x = GaussNaive(A,b)
% input:
%   A = 동일한 계수를 갖는 행렬
%   b = 우변 상수 벡터

% output:
%   x = solution vector

[m,n] = size(A);    % A행렬의 크기를 m, n에 초기화
if m ~= n, error('Matrix A must be square'); end % m과 n은 같은 크기의 행렬
nb = n+1;   % A와 b로부터 확장된 열로 n보다 1크다
Aug =[A b]; % Aug는 A 행렬과 b 우변 벡터를 합쳐서 확장한 행렬이다.

% 전진소거
for k = 1:n-1   % 1에서 n-1번째까지 각 행에서 선정한 피봇
    for i = k+1:n   % 피봇 행 아래에 위치한 행으로 전진 소거가 이루어지는 행
        factor = Aug(i,k)/Aug(k,k); 
        % 정규화 과정, 피봇 Aug(k, k)로 부터 소거할 피봇행 아래의 Aug(i, k)와 나눗셈
        Aug(i, k:nb) = Aug(i, k:nb) - factor*Aug(k, k:nb);
        % 소거가 이루어지는 행으로 Aug(i, k:nb)는 피봇 행의 바로 아래 행이다.
        % 소거가 이루어지는 행의 모든 원소를 k부터 nb까지 소거를 실시한다.
        % 피봇행의 원소와 factor를 곱한 결과를 소거할 행의 원소에서 뺀다.
    end
end

% 후진대입
x = zeros(n,1); % x는 해로 구성된 열벡터
x(n) = Aug(n,nb)/Aug(n,n);
% 전진소거로 만들어진 상삼각행렬의 가장 마지막 부분의 해를 구한다.
for i = n-1:-1:1    % 마지막 행 바로 위의 행부터 첫번째 행까지 해를 구한다.
    x(i) = ( Aug(i, nb) - Aug(i, i+1:n) * x(i+1:n) ) / Aug(i,i);
    % 마지막 행 위의 행부터 첫번째 행까지 올라가면서
    % 바로 직전에서 구한 해들을 이용하여 대입법을 통해 해당 행의 해를 구하는 과정
end
