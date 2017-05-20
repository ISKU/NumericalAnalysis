function [root, fx, ea, i] = ex5_2(func, xl, xu, ead, varargin)
% output
% root: 참값(근)                        
% fx: 참값에서의 함수 값
% ea: 근사 오차(%)
% i: 근을 찾을 때까지 반복횟수

% input
% func: 근을 찾기 위한 함수
% xl, xu: 하한 및 상한 가정값
% ead: 오차

if nargin < 3, error('at least 3 input arguments required'), end
% 입력이 3개 미만일 경우 에러 메시지 출력, func, xl, xu는 필수 입력

test = func(xl, varargin{:})*func(xu,varargin{:});
if test > 0, error('no sign change'); end
% f(cd)이 f(xl)과 f(xu)에서 서로 다른 부호를 가지기 위해 테스트하는 test변수
% f(xl)과 f(xu)에서의 값의 곱으로 양수가 나오게 에러메시지 출력
% 즉, 두 값 사이의 곱이 양수가 나오면 서로 부호가 다르지 않으므로 근이 없는 것


iter = ceil(log2((xu - xl)/ead));
% iter는 반복 수행할 횟수
% 반복계산이 수행될 때마다 오차가 반으로 줄어들므로 오차와 반복횟수에 대한 일반식
% ceil함수를 이용하여 소수점을 무조건 올림해서 정수로 만든다.
i = iter;   % 반복횟수 출력
xr = xl;
% 근을 나타낼 변수 xr = 하한값 초기값 설정 
while(1)
    xrold = xr; % 이전 근사값을 xrold에 저장
    xr = (xl + xu) / 2; % 현재 근사 근(중간점)을 xr에 저장
    iter = iter - 1; % 반복 횟수 1감소
    if xr ~= 0, ea = abs((xr-xrold)/xr) * 100; end % 현재 근사 오차를 구함
   
    test = func(xl, varargin{:}) * func(xr, varargin{:});
    % test변수는 하한 경계와 중간점의 값의 곱으로 서로 다른 부호를 가지는 확인
    if test < 0
        xu = xr;
    % 하한, 상한의 곱이 음수일 경우는 상,하한에서 부호가 다름
    % 즉, 두 값 사이에서 부호가 변하므로, 근이 존재한다
    % 상한값을 현재 중간점으로 설정함
    elseif test > 0
        xl = xr;
     % 하한 경계와 중간점이 같은 부호를 가짐
     % 즉, 두 값 사이에서는 부호가 변하지 않으므로, 근이 존재하지 않는다
     % 그러므로 하한값을 현재 중간점으로 설정함
    else 
        ea = 0;
    end
    if iter <= 0, break, end
    % 초기 반복횟수를 설정한 횟수부터 1씩 감소하여 0이되면 반복 종료
end
root = xr; % 참값(근)
fx = func(xr, varargin{:}); % 참값에서의 함수값 

%fcd = @(cd) sqrt(9.81*80/cd)*tanh(sqrt(9.81*cd/80)*4)-36;