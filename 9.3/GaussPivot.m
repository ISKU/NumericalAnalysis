function x = GaussPivot(A,b)
% input:
%   A = 동일한 계수를 갖는 행렬
%   b = 우변 상수 벡터
% output:
%   x = solution vector

[m,n] = size(A);    % A행렬의 크기를 m, n에 초기화
if m ~= n, error('Matrix A must be square'); end 
% m과 n은 같은 크기의 행렬이어야 한다.
nb = n+1;   % A와 b로부터 확장된 열로 n보다 1크다
Aug =[A b]; % Aug는 A 행렬과 b 우변 벡터를 합쳐서 확장한 행렬이다.

% 전진소거
for k = 1:n-1
    % 부분 피봇팅
    [big, i] = max(abs(Aug(k:n,k)));
    % 피봇을 고르기 위해 첫번째 행부터 마지막 행까지의 피봇의 열에
    % 절대값이 가장 큰 수를 big에 그 값이 있는 행을 i에 초기화한다.
    ipr = i + k - 1; 
    % ipr은 피봇열 바로 다음 열로 
    % 더 작은 원소가 속한 행은 피봇행과 바꿔야 하기 때문이다.
    if ipr ~= k
        Aug([k, ipr],:) = Aug([ipr, k],:); % 두 행의 위치를 바꾼다.
    end
    for i = k+1:n % 피봇팅으로 바뀐 행렬을 적용하여 전진소거 하는 과정이다.
        factor = Aug(i,k)/Aug(k,k); 
        Aug(i, k:nb) = Aug(i, k:nb) - factor*Aug(k, k:nb);
    end
end

% 후진대입
x = zeros(n, 1);
x(n) = Aug(n, nb) / Aug(n,n);
% 전진소거로 만들어진 상삼각행렬의 가장 마지막 부분의 해를 구한다.
for i = n-1:-1:1
    x(i) = (Aug(i, nb) - Aug(i, i+1:n)*x(i+1:n))/Aug(i,i);
    % 마지막 행 위의 행부터 첫번째 행까지 올라가면서
    % 바로 직전에서 구한 해들을 이용하여 대입법을 통해 해당 행의 해를 구하는 과정
end