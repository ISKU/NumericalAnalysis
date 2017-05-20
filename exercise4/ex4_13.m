x = 3; h = 2;
% x: fx(3) ����
% h: h = 3 - 1 = 2

fx = @(x) 25*x^3 - 6*x^2 + 7*x - 88;
fdx = @(x) 75*x^2 - 12*x + 7;
fddx = @(x) 150*x - 12;
fdddx = @(x) 150;
% fx�� ���Լ�

sum = fx(1);
fprintf('0��: %f, ��������: %f\n', sum, abs((fx(3) - sum)/fx(3)) * 100);
sum = fx(1) + fdx(1)*h ;
fprintf('1��: %f, ��������: %f\n', sum, abs((fx(3) - sum)/fx(3)) * 100);
sum = fx(1) + fdx(1)*h + fddx(1)*h^2/factorial(2);
fprintf('2��: %f, ��������: %f\n', sum, abs((fx(3) - sum)/fx(3)) * 100);
sum = fx(1) + fdx(1)*h + fddx(1)*h^2/factorial(2) + fdddx(1)*h^3/factorial(3);
fprintf('3��: %f, ��������: %f\n', sum, abs((fx(3) - sum)/fx(3)) * 100);

% sum: �ٻ簪
% fx(3)�� ���Ϸ� �޼� ���� ������� x=1�� ���������� 0������ 3������ ���ϱ� ����
% fx�� 1�� ���Լ�, 2�� ���Լ� 3�� ���Լ��� �˾ƾ��Ѵ�. h�� 3-1 = 2 �̰�,
% 0���ĺ��� ���ʴ�� sum�� ���Ϸ� �޼� ���� ���� �����ϰ� �ִ�.
% fx(3)�� �������� �ΰ� �� �������� sum�� �Բ� ���ϰ� ����Ѵ�.