% Sample data
x=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
y=[5.176 15.471 45.887 96.5 47.448 19 11.692 12.382 17.846 21.703 16];
pp = spline(x,y);

% Compute coefficients
n = length(x);
h = diff(x);
a = y;
b = diff(y)./h;
c = zeros(1,n);
d = zeros(1,n-1);

A = zeros(n);
A(1,1) = 1;
A(n,n) = 1;

for i=2:n-1
    A(i,i-1:i+1) = [h(i-1) 2*(h(i-1)+h(i)) h(i)];
end

c = A\[0 b(1:end-1) 0]';

for i=1:n-1
    d(i) = (c(i+1)-c(i))/(3*h(i));
end

coefficients = [d; c(1:end-1); b; a(1:end-1)];

% Interpolate at a higher resolution
xi = linspace(x(1), x(end), 1000);
yi = zeros(size(xi));
yii=ppval(pp,xi);

for i=1:length(xi)
    idx = find(x<=xi(i), 1, 'last');
    if isempty(idx)
        idx = 1;
    end
    if idx==n
        idx = n-1;
    end
    dx = xi(i) - x(idx);
    yi(i) = coefficients(1,idx)*dx^3 + coefficients(2,idx)*dx^2 + coefficients(3,idx)*dx + coefficients(4,idx);
end

% Plot original data and interpolated spline
plot(xi, yii, xi, yi);