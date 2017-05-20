function x = Tridiag(e, f, g, r)
% Tridiag(e, f, g, r):
%    Tridiagonal system solver
% input:
%   e = subdiagonal vector (e1�� 0���� ä���)
%   f = diagonal vector
%   g = superdiagonal vector
%   r = right hand side vector
% output
%   x = solution vector

n = length(f);
% �����Ұ�
for k = 2:n
    factor = e(k)/f(k-1); % �Ǻ��� �Ұ��� ���� ������ ����
    % ���ߴ밢����� �Ұ��� ���� ���� e�� f�θ� ������ �̷������.
    f(k) = f(k) - factor*g(k-1);    
    % �Ǻ��� �Ǻ����� �ٷ� �Ʒ��� ���� �ҰŰ���
    r(k) = r(k) - factor*r(k-1);  
    % �Ǻ��� �ٷ� �Ʒ� ���� r �� �ҰŰ���
end

% ��������
disp(f); disp(r);   % �����Ұ��� f�� ���� r�� �� Ȯ��
x(n) = r(n)/f(n);   % �����Ұŷ� ������� ���� ������ ���� �ظ� ����
for k = n-1:-1:1
    x(k) = (r(k) -g(k)*x(k+1)) / f(k);
    % �ٷ� ������ �࿡�� ���� �ظ� �̿��Ͽ� �ش� ���� �ظ� ����
    % ���� ���콺�Ұſʹ� �ٸ��� ���� �Ұ��� ���� ���� f�� g�κ��̱� ������
    % ��������� ���� �����Ѵ�.
end
