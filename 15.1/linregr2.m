function [a, r2] = linregr2(x,y)
% input:
% x = 독립변수
% y = 종속변수
% output:
% a = a1, a0
% r2 = 결정계수

n = length(x); % x의 개수
if length(y)~=n, error('x and y must be same length'); end
% x, y는 같은 개수의 데이터를 가져야 한다.

x = x(:); y=y(:); % convert to column vectors
sx = sum(x); sy = sum(y);   % x의 모든 합, y의 모든 합
sx2 = sum(x.*x); sxy = sum(x.*y); sy2 = sum(y.*y);  % x제곱, y제곱, xy곱 합
sx3 = sum(x.*x.*x); sx4 = sum(x.*x.*x.*x);  % x 3제곱, 4제곱 합
sx2y = sum(x.*x.*y);    % x제곱 y곱 

N = [ n sx sx2; sx sx2 sx3; sx2 sx3 sx4 ];   
r = [ sy; sxy; sx2y; ];               % 정규 방정식
a = N\r;    % a0, a1, a2

%create plot of data and best fit line
xp= 0:0.0001:5;
yp = a(1) + a(2)*xp + a(3)*xp.^2;   % 최소제곱 2차 다항식
plot(x,y,'o',xp,yp)
grid on         % 데이터에 대한 2차 다항식의 접합의 그래프를 보여준다.