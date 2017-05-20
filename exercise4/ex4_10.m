function [sum, et] = ex4_10(func, maxit)
n = 0; sum = 0; et = 0;
% n: �ݺ�Ƚ��
% sum: �ٻ簪
% et: �� ������(%)
while (1)
    sum = sum + ( (-1)^n * func * 0.75^n / factorial(n) ); 
    n = n + 1;
    et = abs((exp(-1) - sum) / exp(-1)) * 100; 
    if n > maxit, break, end;
end

% ���� : exp(-1)
% h = x_i+1 - x_i = 1 - 0.25 = 0.75