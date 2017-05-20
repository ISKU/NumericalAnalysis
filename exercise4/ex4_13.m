x = 3; h = 2;
% x: fx(3) 참값
% h: h = 3 - 1 = 2

fx = @(x) 25*x^3 - 6*x^2 + 7*x - 88;
fdx = @(x) 75*x^2 - 12*x + 7;
fddx = @(x) 150*x - 12;
fdddx = @(x) 150;
% fx의 도함수

sum = fx(1);
fprintf('0차: %f, 참상대오차: %f\n', sum, abs((fx(3) - sum)/fx(3)) * 100);
sum = fx(1) + fdx(1)*h ;
fprintf('1차: %f, 참상대오차: %f\n', sum, abs((fx(3) - sum)/fx(3)) * 100);
sum = fx(1) + fdx(1)*h + fddx(1)*h^2/factorial(2);
fprintf('2차: %f, 참상대오차: %f\n', sum, abs((fx(3) - sum)/fx(3)) * 100);
sum = fx(1) + fdx(1)*h + fddx(1)*h^2/factorial(2) + fdddx(1)*h^3/factorial(3);
fprintf('3차: %f, 참상대오차: %f\n', sum, abs((fx(3) - sum)/fx(3)) * 100);

% sum: 근사값
% fx(3)을 테일러 급수 전개 방법으로 x=1을 기준점으로 0차부터 3차까지 구하기 위해
% fx의 1차 도함수, 2차 도함수 3차 도함수를 알아야한다. h는 3-1 = 2 이고,
% 0차식부터 차례대로 sum에 테일러 급수 전개 식을 저장하고 있다.
% fx(3)을 참값으로 두고 참 상대오차를 sum과 함께 구하고 출력한다.