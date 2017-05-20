function yend = odesimp(dydt, dt, ti, tf, yi, varargin)

t = ti; y = yi; h = dt;
while (1)
    if t + dt > tf, h = tf - t; 
    end
    y = y + dydt(y, varargin{:}) * h;
    t = t + h;
    if t >= tf, break; 
    end
end
yend = y;

% dvdt = @(v, m, cd) 9.81-(cd/m)*v^2;
% odesimp(dvdt, 0.5, 0, 12, -10, 70, 0.23)