function cylinder(r, L, plot_title)
% input:
%   r = 반지름
%   L = 길이
%   plot_title = 그래프 제목
h = linspace(0, 2*r);
V = (r^2 * acos( (r-h)/r ) - (r-h) .* sqrt(2*r*h - h.^2) ) * L;
plot(h, V)
title(plot_title)
xlabel('깊이(h)')
ylabel('체적(V)')

%cylinder(3, 5, 'Volume versus depth for horizontal cylinderical tank')