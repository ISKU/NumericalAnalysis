function yint = Newint(x,y,xx)
% x = independent variable
% y = dependent variable
% xx = value of independent variable for interpolation
% output
% yint = interpolated value of dependent variable

n = length(x); % x�� ����(����)
if length(y) ~=n, error ('x and y must be same length'); end
% x, y�� ������ ���ƾ� �Ѵ�.

b = zeros(n,n);
% nxn size�� ����� ����� 0���� ���� ä���.
% b�� ������ǥ�� �����ϴ� ����̴�.
b(:,1) = y(:); % ù��° ���� y�� ������ �ʱ�ȭ�Ѵ�.

for j = 2:n     % j 2��° ������ ������ŭ
 for i=1:n-j+1  % i ù���� ����� ������ ����� �� ���� ������ 1(j)�� �پ���
                % b����� ������ ����ϴ� �����̴�.
 b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
 % Newton �������׽�
 % n�� �������������� ���� �Ϲ��� ������ ���׽��̴�.
 end
end

disp(b) % ������ǥ ���

xt = 1;
yint = b(1,1);
for j = 1:n-1 
 xt = xt.*(xx-x(j));    
 % ���׽Ŀ� ���� ���� xx�� �����Ͽ� xt�� ���Ѵ�.
 % b1+b2(x-x1)+b3(x-x1)(x-x2)+b4(x-x1)(x-x2)(x-x3)
 % ���� ���� (x-x1)�� �Ѱ��� �÷����鼭 ����.
 yint = yint + b(1,j+1)*xt;
 % xt�� �ݺ����� ������ ������ǥ���� ù��° �ุ ����Ͽ�
 % �Ϲ� ���׽Ŀ� �����Ͽ� yint�� ���Ѵ�.
end 