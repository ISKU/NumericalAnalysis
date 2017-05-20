function xb = incsearch(func, xmin, xmax, ns)
% func: ���� ã�� ���� �Լ�
% xmin: x�� �ּ� ����
% xmax: x�� �ִ� ����
% ns: x�� �������� ������ ��

if nargin < 3, error('at least 3 arguments required'), end
% �Լ� �Է��� 3�� �̸��� ��� �����޽����� ���� (func, xmin, xmax�� �ʼ� �Է�)
if nargin < 4, ns = 50; end
% �Լ� �Է��� 4�� �̸��� ��� ns�� ���� �ڵ����� 50���� ������

x = linspace(xmin, xmax, ns); % �Է¹��� x�� ���� (xmin ~ xmax)
f = func(x); % x�� ������ �Է¹��� �Լ� func�� �����Ͽ� ��Ÿ�� �Լ� f
nb = 0; xb = []; 
% nb: �����ȿ��� ã�� ���� ����
% xb: ���Ѱ� ������ ��谪, �� ���� �ִ� ������ �迭 xb�� ����ȴ�

for k = 1:length(x)-1 % k=1���� x�� ����(ns)-1���� 1�� ���� ���� �ݺ��� ����
    if sign(f(k)) ~= sign(f(k+1)) 
    % ���� ���ʿ��� ��ȣ�� �ٸ��� �˻��Ѵ�.
    % ��, f(k)���� f(k+1)�� ���� ��ȣ�� �ٸ��� �� ���̿� ���� ���� �ϴ� ��
        nb = nb + 1;    % ���� ã��, ã�� ���� ���� 1����
        xb(nb, 1) = x(k);   
        xb(nb, 2) = x(k+1); 
        % nb x 2��  xb �迭�� ���� �ݴ��� ��ȣ�� ���� x���� 1, 2��°�� ����
    end
end % k�� length(x)-1 ���� ũ�� �ݺ��� ����

if isempty (xb) % xb�� null�� ���, �� ���� ã�� ����
    disp('no brackets found')
    disp('check interval or increase ns')
else % xb�� null�� �ƴ� ���, ã�� ���� ���� nb�� ��Ÿ��
    disp('number of brackets:')
    disp(nb)
end
