function [root, ea, iter] = ex6_2b(func, dfunc, xr, es, maxit, varargin)
% output
% root: ����(��)
% ea: �ٻ����(%)
% iter: �ݺ�Ƚ��

% input
% func: ���� ã�� �Լ�
% dfunc: func�� 1�� ���Լ�
% xr: �ʱⰪ(x������ 1�� ���Լ��� ���Ⱑ x��� ������ ��)
% es: �������� �ٻ����(%)
% maxit: �ִ� �ݺ� Ƚ��

if nargin<3, error ('at least 3 input arguments required'), end
if nargin<4 || isempty(es), es=0.0001; end
if nargin<5 || isempty(maxit), maxit=50; end
% �ʼ� �Է� func, dfunc, xr�� �Է����� ������ ���� �޽��� ���
% ���������� �Է����� ������ es�� 0.0001�� �ʱ�ȭ
% �ִ� �ݺ� Ƚ���� �Է����� ������ maxit�� 50���� �ʱ�ȭ
iter = 0;   % �ݺ�Ƚ��

while (1)
    xrold = xr; % ���� xr�� ������ ���� xrold�� ���� (���� �ٻ簪)
    xr = xr  - func(xr) / dfunc(xr);
    % xr�� x������ ������ ���Ⱑ x��� ������ ���̴�.
    % ������ �Լ��� 1�� ���Լ��κ��� ������ ������ �ٿ� ����� �ٻ簪�� ���Ѵ�.
    iter = iter + 1;    % �ݺ�Ƚ�� 1 ����
    
    if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
    % ���� �ٻ������ ����
    fprintf('�ٻ簪: %f, �ٻ����: %f\n', xr, ea);
    % ���� �ٻ簪�� �ٻ������ ���
    
    if ea <= es || iter >= maxit, break, end
    % ���� �ٻ������ ������������ ������ �ٻ���� es���� �۰ų�,
    % �ִ� �ݺ� Ƚ���� ������ maxit���� Ŀ���� �ݺ����� �����Ѵ�.
end
root = xr; % ����(��)