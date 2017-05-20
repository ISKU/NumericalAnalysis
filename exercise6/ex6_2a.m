function [root, ea, iter] = ex6_2a(dfunc, xr, es, maxit, varargin)
% output 
% root: ����(��)
% ea: �ٻ����(%)
% iter: �ݺ�Ƚ��

% input
% dfunc: ���� �Լ����� ����� ������ ���� ������ �Լ�
% xr: �ʱⰪ
% es: �������� �ٻ����(%)
% maxit: �ִ� �ݺ� Ƚ��

iter = 0;
while (1)
    xrold = xr; % ���� xr�� ������ ���� xrold�� ���� (���� �ٻ簪)
    xr = dfunc(xr);
    % ������ �Լ����� ����� ������ ���� ������ �Լ� dfunc�� ���� �ٻ簪�� ����
    % ���� �ٻ簪�� �����Ͽ� ���� �ٻ簪�� ��´�.
    iter = iter + 1;
    
    if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
    % ���� �ٻ������ ����
    fprintf('�ٻ簪: %f, �ٻ����: %f\n', xr, ea);
    % ���� �ٻ簪�� �ٻ������ ���

    if ea <= es || iter >= maxit, break, end
    % �ٻ������ ������ �ٻ���� es���� ���� ���
    % �ݺ�Ƚ���� ������ �ִ� �ݺ�Ƚ������ Ŀ�� ��� �ݺ����� �����Ѵ�.
end
root = xr;