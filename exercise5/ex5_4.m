function [root, fx, ea, iter] = ex5_4(func, xl, xu, es, maxit, varargin)
% output
% root: ����(��)
% fx: ���������� �Լ� ��
% ea: �ٻ� ����(%)
% iter: ���� ã�������� �ݺ�Ƚ��

% input
% func: ���� ã�� ���� �Լ�
% xl, xu: ���� �� ���� ������
% es: ���� ���� ���� �ٻ� ����(%)
% maxit: �ִ� �ݺ�Ƚ��

if nargin < 3, error('at least 3 input arguments required'), end
% �Է��� 3�� �̸��� ��� ���� �޽��� ���, func, xl, xu�� �ʼ� �Է�

test = func(xl, varargin{:})*func(xu,varargin{:});
if test > 0, error('no sign change'); end
% f(m)�� f(xl)�� f(xu)���� ���� �ٸ� ��ȣ�� ������ ���� �׽�Ʈ�ϴ� test����
% f(xl)�� f(xu)������ ���� ������ ����� ������ �����޽��� ���
% ��, �� �� ������ ���� ����� ������ ���� ��ȣ�� �ٸ��� �����Ƿ� ���� ���� ��

if nargin < 4 || isempty(es), es = 0.0001; end 
% ������� es�� �Է����� ���� ��� es�� ���� 0.0001�� �ʱⰪ ����
if nargin < 5 || isempty(maxit), maxit = 50; end
% �ݺ�Ƚ�� maxit�� �Է����� ���� ��� maxit�� ���� 50ȸ�� �ʱⰪ ����
iter = 0; xr = xl; ea = 100;
% �ݺ�Ƚ�� = 0, ���� ��Ÿ�� ���� xr = ���Ѱ�, �ٻ���� = 100%, �ʱⰪ ���� 

while(1)
    xrold = xr; % ���� ���� ������ ���� xrold�� ���� 
    xr = xu - ((func(xu) * (xl - xu))/ (func(xl) - func(xu))); 
    % ���� ���� x��� xl�� xu�� �մ� �������� ������ ����Ͽ� xr�� ���� 
    iter = iter +1; % �ݺ��� Ƚ�� 1����
    
    if xr ~= 0, ea = abs((xr-xrold)/xr) * 100; end % ���� �ٻ� ������ ����
    fprintf('�ٻ簪: %f, �ٻ����: %f\n', xr, ea); % ���� �ٻ簪�� �ٻ������ ���
    
    test = func(xl, varargin{:}) * func(xr, varargin{:});
    % test������ ���� ���� xr ���� ������ ���� �ٸ� ��ȣ�� ������ Ȯ��
    if test < 0
        xu = xr;
    % ����, ������ ���� ������ ���� ��,���ѿ��� ��ȣ�� �ٸ�
    % ��, �� �� ���̿��� ��ȣ�� ���ϹǷ�, ���� �����Ѵ�
    % ���Ѱ��� ���� ������ ������ xr�� ������
    elseif test > 0
        xl = xr;
     % ���� ���� xr�� ���� ��ȣ�� ����
     % ��, �� �� ���̿����� ��ȣ�� ������ �����Ƿ�, ���� �������� �ʴ´�
     % �׷��Ƿ� ���Ѱ��� ���� ������ ������ xr�� ������
    else
        ea = 0;
    % ���Ѱ��, xr�� ���� ���� ������ ���� �ٻ������ 0���� ����
    end
    if ea <= es || iter >= maxit, break, end
    % ���� �ٻ���� ea�� ������ ���� ���� �ٻ���� es���� ���� ��� �ݺ��� ����
end

root = xr; % ����(��)�� ����
fx = func(xr, varargin{:}); % ���������� �Լ��� 
