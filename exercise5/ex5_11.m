S_0 = 8;
Vm = 0.7;
Ks = 2.5;

fs = @(S, t) S_0 - Vm*t + Ks*log(S_0./S) - S;
% S_0, Vm, Ks, t로 정리된 S에 관한 식

t = 0:100;  % t의 범위 0~100
i = 0;  % 반복횟수
while(1)
    i=i+1;
    S(i)=ex5_5b(fs, 0, 100, 0.0001, 100, t(i));
    % fs 함수에 t가 0~100일 때 fs의 근을 이분법으로 구함
    % S(1)~S(101)까지 이분법으로 찾은 각 각의 근을 할당한다.
    if i == 101; break, end;
end
plot(t,S), grid
% t와 S에 관한 그래프를 만든다.
