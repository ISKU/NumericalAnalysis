function [a, r2] = linregr2(x,y)
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
sx2 = sum(x.*x); sxy = sum(x.*y); sy2 = sum(y.*y);  % x����, y����, xy�� ��
sx3 = sum(x.*x.*x); sx4 = sum(x.*x.*x.*x);  % x 3����, 4���� ��
sx2y = sum(x.*x.*y);    % x���� y�� 

N = [ n sx sx2; sx sx2 sx3; sx2 sx3 sx4 ];   
r = [ sy; sxy; sx2y; ];               % ���� ������
a = N\r;    % a0, a1, a2

%create plot of data and best fit line
xp= 0:0.0001:5;
yp = a(1) + a(2)*xp + a(3)*xp.^2;   % �ּ����� 2�� ���׽�
plot(x,y,'o',xp,yp)
grid on         % �����Ϳ� ���� 2�� ���׽��� ������ �׷����� �����ش�.