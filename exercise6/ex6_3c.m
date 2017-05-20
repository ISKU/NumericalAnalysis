fx = @(x) x.^3 - 6*x.^2 + 11*x - 6.1;      % f(x)
xrold2 = 2.5;   
xrold1 = 3.5;   % xrold1,2�� �ʱ� ������

xr = xrold1 - (fx(xrold1)*(xrold2 - xrold1))/(fx(xrold2) - fx(xrold1));
% ���� �Լ��� ���Լ��� ���Ⱑ x�࿡ ������ ���� �ٻ��Ű�� ����̴�.
% Newton-Rapson���� ��쿡�� ���� �Լ��� ���Լ��� �˾ƾ� ������
% �Ҽ����� ��� ���Լ��� ������ �ʰ� ���������� ����Ͽ� ������ ���̴�.
fprintf('1���ٻ簪: %f \n', xr);
xrold2 = xrold1;
xrold1 = xr;
% 2���� �ʱ� ���������κ��� 1�� �ٻ簪�� ���Ѵ�.

xr = xrold1 - (fx(xrold1)*(xrold2 - xrold1))/(fx(xrold2) - fx(xrold1));
fprintf('2���ٻ簪: %f \n', xr);
xrold2 = xrold1;
xrold1 = xr;
% xrold2�� �ʱⰪ 1�� �ٻ簪 xrold1 ����Ͽ� 2�� �ٻ簪�� ���Ѵ�.

xr = xrold1 - (fx(xrold1)*(xrold2 - xrold1))/(fx(xrold2) - fx(xrold1));
fprintf('3���ٻ簪: %f \n', xr);
% 2�� �ٻ簪 xrold1 1�� �ٻ簪 xrold2�� ����Ͽ� 3�� �ٻ簪�� ���Ѵ�.
