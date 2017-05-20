function [a, r2] = linregr(x,y)
% input:
% x = ��������
% y = ���Ӻ���
% output:
% a = a1, a0
% r2 = �������

n = length(x); % x�� ����
if length(y)~=n, error('x and y must be same length'); end
% x, y�� ���� ������ �����͸� ������ �Ѵ�.

x = x(:); y=y(:); % convert to column vectors
sx = sum(x); sy = sum(y);   % x�� ��� ��, y�� ��� ��
sx2 = sum(x.*x); sxy = sum(x.*y); sy2 = sum(y.*y);  % x����, y����, xy��

a(1) = (n*sxy - sx*sy)/(n*sx2-sx^2);    % a1
a(2) = sy/n - a(1)*sx/n;                % a0
r2 = ((n*sxy - sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2  % �������

%create plot of data and best fit line
xp= linspace(min(x),max(x),2);
yp = a(1)*xp + a(2);
plot(x,y,'o',xp,yp)
grid on         % �����Ϳ� ���� ������ �ּ��������տ� ���� �׷����� �����ش�.