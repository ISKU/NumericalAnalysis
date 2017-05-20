function cylinder(r, L, plot_title)
% input:
%   r = ������
%   L = ����
%   plot_title = �׷��� ����
h = linspace(0, 2*r);
V = (r^2 * acos( (r-h)/r ) - (r-h) .* sqrt(2*r*h - h.^2) ) * L;
plot(h, V)
title(plot_title)
xlabel('����(h)')
ylabel('ü��(V)')

%cylinder(3, 5, 'Volume versus depth for horizontal cylinderical tank')