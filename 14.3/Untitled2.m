n = 1000; 
t = 4; 
m = 68.1; 
g = 9.81;
cd = 0.25;
cdmin = cd-0.025;
cdmax = cd+0.025;

r = rand(n,1);  % 0~1까지의 값 1000개 생성
cdrand = cdmin+(cdmax - cdmin)*r;
meancd = mean(cdrand);
stdcd = std(cdrand);

vrand = sqrt(g*m./cdrand).*tanh(sqrt(g*cdrand/m)*t);
meanv = mean(vrand);
fprintf('meancd: %f\n', meancd);
fprintf('stdcd: %f\n', stdcd);
fprintf('meanv: %f\n', meanv);

stdev = 0.01443;
r = randn(n, 1);
cdrand = cd + stdev * r;
vrand = sqrt(g*m./cdrand).*tanh(sqrt(g*cdrand/m)*t);
meanv = mean(vrand);

fprintf('meanv: %f\n', meanv);