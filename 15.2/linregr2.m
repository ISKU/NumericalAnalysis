function a = linregr2(x1, x2, y)
% input:
% x = ��������
% y = ���Ӻ���
% output:
% a = a1, a0

n = length(x1); % x�� ����
if length(y)~=n, error('x and y must be same length'); end
% x, y�� ���� ������ �����͸� ������ �Ѵ�.

x1 = x1(:); x2 = x2(:); y=y(:); % convert to column vectors
sx1 = sum(x1); sx2 = sum(x2); sy = sum(y);   % x1, x2�� ��� ��, y�� ��� ��
sx12 = sum(x1.*x1); sx1x2 = sum(x1.*x2); sx1y = sum(x1.*y);  
% x1����, x1x2 ��, x1y�� �� ��� ��
sx22 = sum(x2.*x2); sx2y = sum(x2.*y); % x2����, x2y���� �����  

N = [ n sx1 sx2; sx1 sx12 sx1x2; sx2 sx1x2 sx22 ];   
r = [ sy; sx1y; sx2y ];               % ���� ������
a = N\r;    % a0, a1, a2
