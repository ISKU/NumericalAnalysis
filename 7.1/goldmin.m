function [x, fx, ea, iter] = goldmin(f, xl, xu, es, maxit, varargin)
% input
% f: �Լ�
% xl: �ʱ� ���Ѱ�
% xu: �ʱ� ���Ѱ�
% es: �������� �ٻ����
% maxit: �ִ� �ݺ�Ƚ��

% output
% x: �ּҰ�
% fx: �ּҰ������� ����
% ea: �ٻ����
% iter: �ݺ�Ƚ��

if nargin < 3, error('at least 3 input arguments required'), end
if nargin < 4 || isempty(es), es=0.0001; end
if nargin < 5 || isempty(maxit), maxit=50; end
% �Լ�, ����, ���� �ּ� 3�� �Է��� �ʿ�
% 3�� ���� �Է½� �������� �ٻ������ 0.0001�� �ʱ�ȭ
% 4�� ���� �Է½� �ִ� �ݺ�Ƚ���� 50ȸ�� �ʱ�ȭ

phi = (1+sqrt(5))/2;    % Ȳ�ݺ�
iter = 0;   % �ݺ�Ƚ��

while(1)
    d = (phi-1)*(xu-xl);
    x1 = xl + d;
    x2 = xu - d;
    % d�� �ΰ��� �߰����� Ȳ�ݺ� ���� ���õǱ� ���� ��
    % �ּҰ��� �߻� ���θ� �˱� ���� x1, x2�� �� ���� �߰� �Լ����̴�
    
    if f(x1, varargin{:}) < f(x2, varargin{:})
        xopt = x1;
        xl = x2;
        % f(x1)�� �ּ��̹Ƿ� x2�� ���� ������ �ּҰ��� ���� ������ ������.
        % xl���� x2�� ���� ������ ������ x2�� ���� �ݺ��� xl�� �ȴ�.
    else
        xopt = x2;
        xu = x1;
        % (fx2)�� �ּ��̹Ƿ� x1�� ������ ������ �ּҰ��� ���� ������ ������.
        % xl���� xu���� x1�� ������ ������ ������ x1�� ���� �ݺ��� xu�� �ȴ�.
    end
    iter = iter +1;
    % �ݺ�Ƚ�� ����
    
    if xopt ~= 0, ea = (2-phi) * abs((xu-xl) / xopt) * 100; end
    if ea <= es || iter >= maxit, break, end
    % ���� �ٻ������ ea�� ���ϰ�
    % ������� �ٻ�������� ���� �ٻ������ �۰ų�,
    % �ִ� �ݺ�Ƚ���� ���� �ݺ�Ƚ���� ������ �ݺ��� �����Ѵ�.
end
x = xopt; fx=f(xopt, varargin{:});
% x�� �ּҰ�, fx�� x������ ����
