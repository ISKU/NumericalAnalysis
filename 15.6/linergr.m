clc; format short g     % 포맷변환

U = [0.5 2 10 0.5 2 10 0.5 2 10]';  % 평균속도
H = [0.15 0.15 0.15 0.3 0.3 0.3 0.5 0.5 0.5]';  % 깊이
KL = [0.48 3.9 57 0.85 5 77 0.8 9 92]'; % 전달계수
% 일정한 온도 섭씨 20도에 있는 실헝용 개수로에서 얻어진 데이터

logU = log10(U);
logH = log10(H);
logKL = log10(KL);
% 로그 변환

Z = [ones(size(logKL)) logU logH];  
a = (Z'*Z)\(Z'*logKL)