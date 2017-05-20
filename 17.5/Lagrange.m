function yint = Lagrange(x,y,xx)
% input
% x = independent variable
% y = dependent variable
% xx = value of independent variable for interpolation
% output
% yint = interpolated value of dependent variable

n = length(x);  % x�� ����(����)
if length(y) ~=n, error ('x and y must be same length'); end
% x�� y�� ������ ���ƾ��Ѵ�.

s = 0;  % �ٻ簪
for i = 1:n     % ù ����� ������ŭ
 product = y(i); 
 for j = 1:n    % ù ����� ������ŭ
 if i ~= j  % i�� j�� ���� �ʾƾ� �Ѵ�
 product = product * (xx-x(j))/(x(i)-x(j));
 % Lagrange ���׽�
 end
 end
 s = s + product;
 % ���� �ٻ簪�� ���Ѵ�.
end
yint = s;