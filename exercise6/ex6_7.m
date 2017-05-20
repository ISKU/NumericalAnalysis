function root = ex6_7(func,xr,delta,es,maxit) 
% input
% func: �Լ�
% xr = �ʱⰪ
% delta = ������
% es = ���� ���� �ٻ����
% maxit = �ִ� �ݺ� Ƚ��

% output 
% root = ���� 

if nargin<5, maxit=50; end % 4�� ���� �Է� �ִ�ݺ� Ƚ�� maxit 50���� �ʱ�ȭ
if nargin<4, es=0.001; end % 3�� ���� �Է� ������� �ٻ���� 0.001 �ʱ�ȭ 
if nargin<3, delta=1E-5; end % 2�� ���� �Է� ������ 0.00001 �ʱ�ȭ 

% Secant method 
iter = 0; 
while (1) 
    xrold = xr; % ���� �ٻ簪
    xr = xr - (delta*xr*func(xr)/(func(xr+delta*xr)-func(xr)));
    % Newton-Raphson������ �Լ��� ���Լ�(����)�� x��� ������ ��
    % ���� �Լ��� ���Լ��� ������ �ʰ� �������� �־� ������ ��
    iter = iter + 1;    % �ݺ�Ƚ�� 1����
    
    if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
    fprintf('�ٻ簪: %f, �ٻ����: %f\n', xr, ea);
    if ea <= es || iter >= maxit, break, end
    % ���� �ٻ���� ea�� ����ϰ�,
    % ea�� ������� �ٻ�������� �۰ų�, iter�� �ִ� �ݺ�Ƚ������ ũ�� �Ǹ�
    % �ݺ��� �� �̻� �����Ѵ�.
end
root = xr;  % �ݺ� ���� �� ����