function yint = Newint(x,y,xx)
% x = independent variable
% y = dependent variable
% xx = value of independent variable for interpolation
% output
% yint = interpolated value of dependent variable

n = length(x); % x의 개수(길이)
if length(y) ~=n, error ('x and y must be same length'); end
% x, y의 개수가 같아야 한다.

b = zeros(n,n);
% nxn size의 행렬을 만들고 0으로 값을 채운다.
% b는 제차분표를 구성하는 행렬이다.
b(:,1) = y(:); % 첫번째 열을 y의 값으로 초기화한다.

for j = 2:n     % j 2번째 열부터 개수만큼
 for i=1:n-j+1  % i 첫번재 행부터 마지막 행까지 각 행의 개수는 1(j)씩 줄어든다
                % b행렬의 반절만 사용하는 형태이다.
 b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
 % Newton 보간다항식
 % n차 유한제차분으로 구한 일반적 형태의 다항식이다.
 end
end

disp(b) % 제차분표 출력

xt = 1;
yint = b(1,1);
for j = 1:n-1 
 xt = xt.*(xx-x(j));    
 % 다항식에 값을 구할 xx를 대입하여 xt를 구한다.
 % b1+b2(x-x1)+b3(x-x1)(x-x2)+b4(x-x1)(x-x2)(x-x3)
 % 위와 같이 (x-x1)을 한개씩 늘려가면서 구함.
 yint = yint + b(1,j+1)*xt;
 % xt에 반복으로 구해진 제차분표에서 첫번째 행만 사용하여
 % 일반 다항식에 대입하여 yint를 구한다.
end 