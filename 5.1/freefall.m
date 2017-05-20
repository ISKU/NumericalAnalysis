cd = 0.25; g = 9.81; v = 36; t = 4;
% cd: 항력계수 (kg/m)
% g: 중력가속도 (m/s^2)
% v: 속도 (m/s)
% t: 시간 (s)

mp = linspace(50, 200);
fp = sqrt(g*mp/cd) .*tanh(sqrt(g*cd./mp)*t)-v; 
plot(mp, fp), grid