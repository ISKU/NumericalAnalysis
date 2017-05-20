fx = @(x) x.^3 - 6*x.^2 + 11*x - 6.1;      % f(x)
xr = 3.5;   % 초기 가정값
delta = 0.01;   % 변동량

xr = xr - (delta*xr*fx(xr)/(fx(xr+delta*xr)-fx(xr)));
fprintf('1차근사값: %f \n', xr);
% 원래 함수의 도함수의 기울기가 x축에 만나는 점을 근사시키는 방법이다.
% Newton-Rapson법의 경우에는 원래 함수의 도함수를 알아야 하지만 후향차분을 사용
% 수정된 할선법의 경우에는 두 개의 초기값을 사용하는 할선법 대신에
% 변동량을 주어 해를 구하는 방법이다.

xr = xr - (delta*xr*fx(xr)/(fx(xr+delta*xr)-fx(xr)));
fprintf('2차근사값: %f \n', xr);
% 1차 근사값 xr로부터 2차 근사값을 구한다.

xr = xr - (delta*xr*fx(xr)/(fx(xr+delta*xr)-fx(xr)));
fprintf('3차근사값: %f \n', xr);
% 2차 근사값 xr로부터 3차 근사값을 구한다.
