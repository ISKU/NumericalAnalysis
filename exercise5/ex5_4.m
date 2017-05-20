function [root, fx, ea, iter] = ex5_4(func, xl, xu, es, maxit, varargin)
% output
% root: 참값(근)
% fx: 참값에서의 함수 값
% ea: 근사 오차(%)
% iter: 근을 찾을때까지 반복횟수

% input
% func: 근을 찾기 위한 함수
% xl, xu: 하한 및 상한 가정값
% es: 종료 판정 기준 근사 오차(%)
% maxit: 최대 반복횟수

if nargin < 3, error('at least 3 input arguments required'), end
% 입력이 3개 미만일 경우 에러 메시지 출력, func, xl, xu는 필수 입력

test = func(xl, varargin{:})*func(xu,varargin{:});
if test > 0, error('no sign change'); end
% f(m)이 f(xl)과 f(xu)에서 서로 다른 부호를 가지기 위해 테스트하는 test변수
% f(xl)과 f(xu)에서의 값의 곱으로 양수가 나오게 에러메시지 출력
% 즉, 두 값 사이의 곱이 양수가 나오면 서로 부호가 다르지 않으므로 근이 없는 것

if nargin < 4 || isempty(es), es = 0.0001; end 
% 종료기준 es를 입력하지 않을 경우 es의 값을 0.0001로 초기값 설정
if nargin < 5 || isempty(maxit), maxit = 50; end
% 반복횟수 maxit를 입력하지 않을 경우 maxit의 값을 50회로 초기값 설정
iter = 0; xr = xl; ea = 100;
% 반복횟수 = 0, 근을 나타낼 변수 xr = 하한값, 근사오차 = 100%, 초기값 설정 

while(1)
    xrold = xr; % 현재 근을 임의의 변수 xrold에 저장 
    xr = xu - ((func(xu) * (xl - xu))/ (func(xl) - func(xu))); 
    % 현재 근을 x축과 xl과 xu를 잇는 직선과의 교점을 계산하여 xr에 저장 
    iter = iter +1; % 반복한 횟수 1증가
    
    if xr ~= 0, ea = abs((xr-xrold)/xr) * 100; end % 현재 근사 오차를 구함
    fprintf('근사값: %f, 근사오차: %f\n', xr, ea); % 현재 근사값과 근사오차를 출력
    
    test = func(xl, varargin{:}) * func(xr, varargin{:});
    % test변수는 하한 경계와 xr 값의 곱으로 서로 다른 부호를 가지는 확인
    if test < 0
        xu = xr;
    % 하한, 상한의 곱이 음수일 경우는 상,하한에서 부호가 다름
    % 즉, 두 값 사이에서 부호가 변하므로, 근이 존재한다
    % 상한값을 현재 직선의 교점인 xr로 설정함
    elseif test > 0
        xl = xr;
     % 하한 경계와 xr이 같은 부호를 가짐
     % 즉, 두 값 사이에서는 부호가 변하지 않으므로, 근이 존재하지 않는다
     % 그러므로 하한값을 현재 직선의 교점인 xr로 설정함
    else
        ea = 0;
    % 하한경계, xr의 값이 근을 가지는 경우로 근사오차는 0으로 설정
    end
    if ea <= es || iter >= maxit, break, end
    % 현재 근사오차 ea가 설정한 종료 판정 근사오차 es보다 작을 경우 반복문 종료
end

root = xr; % 참값(근)을 구함
fx = func(xr, varargin{:}); % 참값에서의 함수값 
