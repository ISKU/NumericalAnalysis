function [a, r2] = linregr(x,y)
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
sx2 = sum(x.*x); sxy = sum(x.*y); sy2 = sum(y.*y);  % x제곱, y제곱, xy곱

a(1) = (n*sxy - sx*sy)/(n*sx2-sx^2);    % a1
a(2) = sy/n - a(1)*sx/n;                % a0
r2 = ((n*sxy - sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2  % 결정계수

%create plot of data and best fit line
xp= linspace(min(x),max(x),2);
yp = a(1)*xp + a(2);
plot(x,y,'o',xp,yp)
grid on         % 데이터에 대한 직선의 최소제곱접합에 대한 그래프를 보여준다.