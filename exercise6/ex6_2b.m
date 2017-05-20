function [root, ea, iter] = ex6_2b(func, dfunc, xr, es, maxit, varargin)
% output
% root: 참값(근)
% ea: 근사오차(%)
% iter: 반복횟수

% input
% func: 근을 찾을 함수
% dfunc: func의 1차 도함수
% xr: 초기값(x에서의 1차 도함수의 기울기가 x축과 만나는 점)
% es: 종료조건 근사오차(%)
% maxit: 최대 반복 횟수

if nargin<3, error ('at least 3 input arguments required'), end
if nargin<4 || isempty(es), es=0.0001; end
if nargin<5 || isempty(maxit), maxit=50; end
% 필수 입력 func, dfunc, xr을 입력하지 않으면 오류 메시지 출력
% 종로조건을 입력하지 않으면 es는 0.0001로 초기화
% 최대 반복 횟수를 입력하지 않으면 maxit는 50으로 초기화
iter = 0;   % 반복횟수

while (1)
    xrold = xr; % 현재 xr을 임의의 변수 xrold에 저장 (이전 근사값)
    xr = xr  - func(xr) / dfunc(xr);
    % xr은 x에서의 접선의 기울기가 x축과 만나는 점이다.
    % 원래의 함수와 1차 도함수로부터 유도된 식으로 근에 가까운 근사값을 구한다.
    iter = iter + 1;    % 반복횟수 1 증가
    
    if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
    % 현재 근사오차를 구함
    fprintf('근사값: %f, 근사오차: %f\n', xr, ea);
    % 현재 근사값과 근사오차를 출력
    
    if ea <= es || iter >= maxit, break, end
    % 현재 근사오차가 종료조건으로 설정한 근사오차 es보다 작거나,
    % 최대 반복 횟수로 설정한 maxit보다 커지면 반복문을 종료한다.
end
root = xr; % 참값(근)