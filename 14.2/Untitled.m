n = 1000; 
t = 4; 
m = 68.1; 
g = 9.81;
cd = 0.25;
cdmin = cd-0.025;
cdmax = cd+0.025;

r = rand(n,1);  % 0~1까지의 값 1000개 생성
cdrand = cdmin+(cdmax - cdmin)*r;
meancd = mean(cdrand)
stdcd = std(cdrand)

vrand = sqrt(g*m./cdrand).*tanh(sqrt(g*cdrand/m)*t);
meanv = mean(vrand)

