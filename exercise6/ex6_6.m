function root = ex6_6(func, xrold2, xrold1, es, maxit) 
% input
% func: 함수
% xrold2 = 초기값 (전 전 근사값)
% xorld1 = 초기값 (전 근사값)
% es = 종료 기준 근사오차
% maxit = 최대 반복 횟수

% output 
% root = 참값 

if nargin<5, maxit=50; end % 4개 이하 입력 최대반복 횟수 maxit 50으로 초기화
if nargin<4, es=0.001; end % 3개 이하 입력 종료기준 근사오차 0.001 초기화 

iter = 0; 
while (1) 
    xr = xrold1 - (func(xrold1)*(xrold2 - xrold1))/(func(xrold2) - func(xrold1));
    % Newton-Raphson법에서 함수의 도함수(접선)이 x축과 만나는 점
    % 원래 함수의 도함수를 구하지 않고서 후향차분으로 만든 근사식이다.
    iter = iter + 1;    % 반복횟수 1증가
    
    if xr ~= 0, ea = abs((xr - xrold1)/xr) * 100; end
    fprintf('근사값: %f, 근사오차: %f\n', xr, ea);
    if ea <= es || iter >= maxit, break, end
    % 현재 근사오차 ea를 계산하고,
    % ea가 종료기준 근사오차보다 작거나, iter가 최대 반복횟수보다 크게 되면
    % 반복을 더 이상 종료한다.
    
    xrold2 = xrold1; % 전 전 근사값
    xrold1 = xr; % 전 근사값
end
root = xr;  % 반복 종료 후 참값