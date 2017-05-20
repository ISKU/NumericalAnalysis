function [a, r2] = linregrlog(x1,y1)
% input:
% x = 독립변수
% y = 종속변수
% output:
% a = a1, a0
% r2 = 결정계수

x = log10(x1);
y = log10(y1);
% log 변환

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
xp= 0:0.0001:80;
yp = 10.^a(2) .* xp.^a(1);      % 최소제곱접합(log)
plot(x1, y1,'o',xp,yp)
grid on        % 데이터에 대한 최소제곱접합에서 변환된 데이터의 멱방정식 접합