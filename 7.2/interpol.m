function [xopt, fopt, iter] = interpol(func, xlow, xmiddle, xhigh, es, maxit, varargin)
% input
% func: 함수
% xlow: 초기 하한값
% xmiddle: 초기 중간값
% xhigh: 초기 상한값     세점을 잇는 포물선
% es: 종료기준 근사오차
% maxit: 최대 반복횟수

% output
% xopt: 최소값
% fopt: 최소값에서의 참값
% iter: 반복횟수

if nargin < 4, error('at least 3 input arguments required'), end
if nargin < 5 || isempty(es), es=0.0001; end
if nargin < 6 || isempty(maxit), maxit=50; end
% 함수, 상한, 중간, 하한값 최소 4개 입력 필요
% 4개 이하 입력시 종료기준 근사오차 0.0001로 초기화
% 5개 이하 입력시 최대 반복횟수 50개 초기화

iter = 0;
x1 = xlow;
x2 = xmiddle;
x3 = xhigh;
f1 = func(x1, varargin{:});
f2 = func(x2, varargin{:});
f3 = func(x3, varargin{:});
% 초기값: 세 점 x1, x2, x3과 각 각의 점에서 참값을 f1, f2, f3에 초기화한다.

if f2 < f1 && f2 < f3
    xoptold = x2;
    while(1)
        xopt = x2 - ( 0.5 * ( ( (x2-x1)^2 *(f2-f3) ) - ( (x2-x3)^2 * (f2-f1) ) ) ...
            / ( ((x2-x1)*(f2-f3)) - ((x2-x3)*(f2-f1)) ) );
        % 세점을 잇는 포물선을 미분하여 결과식을 0으로 만들고 이를 만족하는 최소값 추정식
        fopt = func(xopt, varargin{:});
        % 최소값에서의 참값
        iter = iter+1;
        % 반복횟수 증가
        
        if xopt > x2
            x1 = x2;
            f1 = f2;
            % 최소값이 x2보다 크면 최소값이 중간점의 오른쪽에 있으므로
            % x1을 버린다.
        else
            x3 = x2;
            f3 = f2;
            % 최소값이 x2보다 작으면 최소값이 중간점의 왼쪽에 있으므로
            % x3을 버린다.
        end
        x2 = xopt;  % 현재 최소값을 중간점으로 설정
        f2 = fopt;  % 중간점의 함수 값을 초기화
        
        if xopt ~=0, ea = abs((xopt - xoptold) / xopt) * 100; end
        xoptold = xopt;
        if ea<=es || iter >= maxit, break, end
        fprintf('근사값: %f, 참값: %f\n', xopt, fopt);n
        % 종료기준 근사오차보다 현재 근사오차가 작아지거나
        % 최대반복횟수가 현재 반복횟수보다 커지면 반복을 종료한다.
    end
else
    error('bracket does not contain minimum')
end
