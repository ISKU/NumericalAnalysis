function [U, Ut, x] = cholesky(A)
% input:
%   A = ���簢���
% output:
%   U = ��ﰢ���
%   Ut = U�� Transpose���
%   x = ��


[m,n] = size(A);    % m n �� ��� A�� ũ��
if m~=n, error('Matrix A must be square'); end % A�� ���簢 ����̾�� �Ѵ�.

for i = 1:n
  s = 0;
  for k = 1:i-1
    s = s + U(k, i) ^ 2;    
  end
  U(i, i) = sqrt(A(i, i) - s);  % U11, U22, U33�� ����
  for j = i + 1:n
    s = 0;
    for k = 1:i-1
      s = s + U(k, i) * U(k, j); 
    end
    U(i, j) = (A(i, j) - s) / U(i, i);     % U12, U13, U23�� ����
  end
end
% U' * U = X�� �����ϴ� ��ﰢ��� U�� ���ϴ� ����

b = [sum(A(1,:)); sum(A(2,:)); sum(A(3,:))];
% ������ �࿡ �ش��ϴ� ������ ������ �캯 ������ ���� ���� ������

for i = 1:n
    for j = 1:n
        Ut(i, j) = U(j, i);
    end
end
% U�� Transpose��� Ut�� ��� ���� ��ġ�� �ٲپ� ���Ѵ�.

d = Ut\b;   % Ut�� �캯���� b�κ��� d�� �ظ� ���Ѵ�.
x = U\d;    % U�� d�κ��� ���������� x�� �ظ� ����.



