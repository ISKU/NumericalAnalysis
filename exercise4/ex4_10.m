function [sum, et] = ex4_10(func, maxit)
n = 0; sum = 0; et = 0;
% n: 반복횟수
% sum: 근사값
% et: 참 상대오차(%)
while (1)
    sum = sum + ( (-1)^n * func * 0.75^n / factorial(n) ); 
    n = n + 1;
    et = abs((exp(-1) - sum) / exp(-1)) * 100; 
    if n > maxit, break, end;
end

% 참값 : exp(-1)
% h = x_i+1 - x_i = 1 - 0.25 = 0.75