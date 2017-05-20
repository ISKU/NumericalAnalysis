cd = 0.25; g = 9.81; v = 36; t = 4;
% cd: �׷°�� (kg/m)
% g: �߷°��ӵ� (m/s^2)
% v: �ӵ� (m/s)
% t: �ð� (s)

mp = linspace(50, 200);
fp = sqrt(g*mp/cd) .*tanh(sqrt(g*cd./mp)*t)-v; 
plot(mp, fp), grid