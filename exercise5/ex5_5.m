x = [-1:0.001:5];
% x의 범위는 -1과 5사이에 0.001의 간격
fx = -12 -21*x + 18*x.^2 - 2.75*x.^3;
% f(x)의 근을 구한다.
plot(x, fx), grid
% x와 fx의 관계를 그래프로 나타내는 함수