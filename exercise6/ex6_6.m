function root = ex6_6(func, xrold2, xrold1, es, maxit) 
% input
% func: �Լ�
% xrold2 = �ʱⰪ (�� �� �ٻ簪)
% xorld1 = �ʱⰪ (�� �ٻ簪)
% es = ���� ���� �ٻ����
% maxit = �ִ� �ݺ� Ƚ��

% output 
% root = ���� 

if nargin<5, maxit=50; end % 4�� ���� �Է� �ִ�ݺ� Ƚ�� maxit 50���� �ʱ�ȭ
if nargin<4, es=0.001; end % 3�� ���� �Է� ������� �ٻ���� 0.001 �ʱ�ȭ 

iter = 0; 
while (1) 
    xr = xrold1 - (func(xrold1)*(xrold2 - xrold1))/(func(xrold2) - func(xrold1));
    % Newton-Raphson������ �Լ��� ���Լ�(����)�� x��� ������ ��
    % ���� �Լ��� ���Լ��� ������ �ʰ� ������������ ���� �ٻ���̴�.
    iter = iter + 1;    % �ݺ�Ƚ�� 1����
    
    if xr ~= 0, ea = abs((xr - xrold1)/xr) * 100; end
    fprintf('�ٻ簪: %f, �ٻ����: %f\n', xr, ea);
    if ea <= es || iter >= maxit, break, end
    % ���� �ٻ���� ea�� ����ϰ�,
    % ea�� ������� �ٻ�������� �۰ų�, iter�� �ִ� �ݺ�Ƚ������ ũ�� �Ǹ�
    % �ݺ��� �� �̻� �����Ѵ�.
    
    xrold2 = xrold1; % �� �� �ٻ簪
    xrold1 = xr; % �� �ٻ簪
end
root = xr;  % �ݺ� ���� �� ����