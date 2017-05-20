function yint = Lagrange(x,y,xx)
% input
% x = independent variable
% y = dependent variable
% xx = value of independent variable for interpolation
% output
% yint = interpolated value of dependent variable

n = length(x);  % x의 길이(개수)
if length(y) ~=n, error ('x and y must be same length'); end
% x와 y의 개수는 같아야한다.

s = 0;  % 근사값
for i = 1:n     % 첫 행부터 개수만큼
 product = y(i); 
 for j = 1:n    % 첫 행부터 개수만큼
 if i ~= j  % i와 j가 같지 않아야 한다
 product = product * (xx-x(j))/(x(i)-x(j));
 % Lagrange 다항식
 end
 end
 s = s + product;
 % 현재 근사값을 더한다.
end
yint = s;