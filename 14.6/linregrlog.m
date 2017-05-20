function [a, r2] = linregrlog(x1,y1)
% input:
% x = ��������
% y = ���Ӻ���
% output:
% a = a1, a0
% r2 = �������

x = log10(x1);
y = log10(y1);
% log ��ȯ

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
xp= 0:0.0001:80;
yp = 10.^a(2) .* xp.^a(1);      % �ּ���������(log)
plot(x1, y1,'o',xp,yp)
grid on        % �����Ϳ� ���� �ּ��������տ��� ��ȯ�� �������� ������� ����