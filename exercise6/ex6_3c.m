fx = @(x) x.^3 - 6*x.^2 + 11*x - 6.1;      % f(x)
xrold2 = 2.5;   
xrold1 = 3.5;   % xrold1,2는 초기 가정값

xr = xrold1 - (fx(xrold1)*(xrold2 - xrold1))/(fx(xrold2) - fx(xrold1));
% 원래 함수의 도함수의 기울기가 x축에 만나는 점을 근사시키는 방법이다.
% Newton-Rapson법의 경우에는 원래 함수의 도함수를 알아야 하지만
% 할선법의 경우 도함수를 구하지 않고 후향차분을 사용하여 유도한 식이다.
fprintf('1차근사값: %f \n', xr);
xrold2 = xrold1;
xrold1 = xr;
% 2개의 초기 가정값으로부터 1차 근사값을 구한다.

xr = xrold1 - (fx(xrold1)*(xrold2 - xrold1))/(fx(xrold2) - fx(xrold1));
fprintf('2차근사값: %f \n', xr);
xrold2 = xrold1;
xrold1 = xr;
% xrold2는 초기값 1차 근사값 xrold1 사용하여 2차 근사값을 구한다.

xr = xrold1 - (fx(xrold1)*(xrold2 - xrold1))/(fx(xrold2) - fx(xrold1));
fprintf('3차근사값: %f \n', xr);
% 2차 근사값 xrold1 1차 근사값 xrold2를 사용하여 3차 근사값을 구한다.
