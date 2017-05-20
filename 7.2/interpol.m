function [xopt, fopt, iter] = interpol(func, xlow, xmiddle, xhigh, es, maxit, varargin)
% input
% func: �Լ�
% xlow: �ʱ� ���Ѱ�
% xmiddle: �ʱ� �߰���
% xhigh: �ʱ� ���Ѱ�     ������ �մ� ������
% es: ������� �ٻ����
% maxit: �ִ� �ݺ�Ƚ��

% output
% xopt: �ּҰ�
% fopt: �ּҰ������� ����
% iter: �ݺ�Ƚ��

if nargin < 4, error('at least 3 input arguments required'), end
if nargin < 5 || isempty(es), es=0.0001; end
if nargin < 6 || isempty(maxit), maxit=50; end
% �Լ�, ����, �߰�, ���Ѱ� �ּ� 4�� �Է� �ʿ�
% 4�� ���� �Է½� ������� �ٻ���� 0.0001�� �ʱ�ȭ
% 5�� ���� �Է½� �ִ� �ݺ�Ƚ�� 50�� �ʱ�ȭ

iter = 0;
x1 = xlow;
x2 = xmiddle;
x3 = xhigh;
f1 = func(x1, varargin{:});
f2 = func(x2, varargin{:});
f3 = func(x3, varargin{:});
% �ʱⰪ: �� �� x1, x2, x3�� �� ���� ������ ������ f1, f2, f3�� �ʱ�ȭ�Ѵ�.

if f2 < f1 && f2 < f3
    xoptold = x2;
    while(1)
        xopt = x2 - ( 0.5 * ( ( (x2-x1)^2 *(f2-f3) ) - ( (x2-x3)^2 * (f2-f1) ) ) ...
            / ( ((x2-x1)*(f2-f3)) - ((x2-x3)*(f2-f1)) ) );
        % ������ �մ� �������� �̺��Ͽ� ������� 0���� ����� �̸� �����ϴ� �ּҰ� ������
        fopt = func(xopt, varargin{:});
        % �ּҰ������� ����
        iter = iter+1;
        % �ݺ�Ƚ�� ����
        
        if xopt > x2
            x1 = x2;
            f1 = f2;
            % �ּҰ��� x2���� ũ�� �ּҰ��� �߰����� �����ʿ� �����Ƿ�
            % x1�� ������.
        else
            x3 = x2;
            f3 = f2;
            % �ּҰ��� x2���� ������ �ּҰ��� �߰����� ���ʿ� �����Ƿ�
            % x3�� ������.
        end
        x2 = xopt;  % ���� �ּҰ��� �߰������� ����
        f2 = fopt;  % �߰����� �Լ� ���� �ʱ�ȭ
        
        if xopt ~=0, ea = abs((xopt - xoptold) / xopt) * 100; end
        xoptold = xopt;
        if ea<=es || iter >= maxit, break, end
        fprintf('�ٻ簪: %f, ����: %f\n', xopt, fopt);n
        % ������� �ٻ�������� ���� �ٻ������ �۾����ų�
        % �ִ�ݺ�Ƚ���� ���� �ݺ�Ƚ������ Ŀ���� �ݺ��� �����Ѵ�.
    end
else
    error('bracket does not contain minimum')
end
