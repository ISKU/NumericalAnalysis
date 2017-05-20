x = 2;
% x: fdx(2) 참값
% h: 간격

fx = @(x) 25*x^3 - 6*x^2 + 7*x - 88;
fddx = @(x) 150*x - 12;
% fddx = fx의 2차 도함수

fprintf('참값: fddx(2) = %f, \n', fddx(2));
% 참값

h = 0.2;
fprintf('중심차분(h=0.2) : fddx(2) = %f, \n', ( (fx(x+h) - fx(x))/h - (fx(x) - fx(x-h))/h ) / h);

h = 0.1;
fprintf('중심차분(h=0.1) : fddx(2) = %f, \n', ( (fx(x+h) - fx(x))/h - (fx(x) - fx(x-h))/h ) / h);

% f''(2)를 중심차분으로 구했을 때 값은 참값과 일치하다
% 또 간격 h를 0.2와 0.1로 각 각 중심차분을 구했을 때 결과도 참값과 일치하다.

