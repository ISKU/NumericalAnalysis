function a = linregr2(x1, x2, y)
% input:
% x = 독립변수
% y = 종속변수
% output:
% a = a1, a0

n = length(x1); % x의 개수
if length(y)~=n, error('x and y must be same length'); end
% x, y는 같은 개수의 데이터를 가져야 한다.

x1 = x1(:); x2 = x2(:); y=y(:); % convert to column vectors
sx1 = sum(x1); sx2 = sum(x2); sy = sum(y);   % x1, x2의 모든 합, y의 모든 합
sx12 = sum(x1.*x1); sx1x2 = sum(x1.*x2); sx1y = sum(x1.*y);  
% x1제곱, x1x2 곱, x1y곱 의 모든 합
sx22 = sum(x2.*x2); sx2y = sum(x2.*y); % x2제곱, x2y곱의 모든합  

N = [ n sx1 sx2; sx1 sx12 sx1x2; sx2 sx1x2 sx22 ];   
r = [ sy; sx1y; sx2y ];               % 정규 방정식
a = N\r;    % a0, a1, a2
