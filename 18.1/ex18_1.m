%data
xi = [ 3.0 4.5 7.0 9.0 ];
fi = [ 2.5 1.0 2.5 0.5 ];

% 각 점의 선형 스플라인 함수
s1 = @(x) fi(1) +  ( (fi(1+1) - fi(1)) * (x - xi(1)) )/ (xi(1+1) - xi(1));
s2 = @(x) fi(2) +  ( (fi(2+1) - fi(2)) * (x - xi(2)) )/ (xi(2+1) - xi(2));
s3 = @(x) fi(3) +  ( (fi(3+1) - fi(3)) * (x - xi(3)) )/ (xi(3+1) - xi(3));

% 데이터 범위 그래프
xx = linspace(3, 9);
yy = interp1(xi, fi, xx, 'linear');   % 선형 스플라인 (각 점을 잇는 직선)
plot(xi, fi, 'o')
hold on;
plot(xx, yy);
hold off;

% x = 5일 때 함수값
s2(5)