function [root, ea, iter] = ex6_2a(dfunc, xr, es, maxit, varargin)
% output 
% root: 참값(근)
% ea: 근사오차(%)
% iter: 반복횟수

% input
% dfunc: 원래 함수에서 대수적 조작을 통해 유도된 함수
% xr: 초기값
% es: 종료조건 근사오차(%)
% maxit: 최대 반복 횟수

iter = 0;
while (1)
    xrold = xr; % 현재 xr을 임의의 변수 xrold에 저장 (이전 근사값)
    xr = dfunc(xr);
    % 원래의 함수에서 대수적 조작을 통해 유도된 함수 dfunc에 이전 근사값을 대입
    % 이전 근사값을 대입하여 현재 근사값을 얻는다.
    iter = iter + 1;
    
    if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
    % 현재 근사오차를 구함
    fprintf('근사값: %f, 근사오차: %f\n', xr, ea);
    % 현재 근사값과 근사오차를 출력

    if ea <= es || iter >= maxit, break, end
    % 근사오차가 설정한 근사오차 es보다 작을 경우
    % 반복횟수가 설정한 최대 반복횟수보다 커질 경우 반복문을 종료한다.
end
root = xr;