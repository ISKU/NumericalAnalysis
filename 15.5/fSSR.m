function f = fSSR(a, xm, ym)
yp = a(1)*xm.^a(2); % ���� ��
f = sum((ym-yp).^2); % �������� ����ϱ� ���� ���� �Լ�

% ���� �Լ�
% fminsearch�κ��� p1, p2, ...�� �������� �Ѱ�����.