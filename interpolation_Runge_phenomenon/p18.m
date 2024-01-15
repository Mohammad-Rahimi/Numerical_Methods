% since we are doing inverse interpolattion i replaced the dependent and
% independent variables
x=[2,2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9];
j0=[0.223891,0.166607,0.110362,0.05554,0.002508,-0.04838,-0.0968,-0.14245,-0.18504,-0.22431];
xxx=Newtint(j0,x,0)
function yint = Newtint(x,y,xx)
% Newtint: Newton interpolating polynomial
% yint = Newtint(x,y,xx): Uses an (n - 1)-order Newton interpolating polynomial based on n 
%  data points (x, y) to determine a value of the dependent variable (yint)@ a given value of 
%  the independent variable, xx.
% input:
%   x = independent variable; %   y = dependent variable
%   xx = value of independent variable at which interpolation is calculated
% output: yint = interpolated value of dependent variable
% compute the finite divided differences in the form of a difference table
n = length(x);
if length(y)~=n, error('x and y must be same length'); end
b = zeros(n,n);
% assign dependent variables to the first column of b.
b(:,1) = y(:); % the (:) ensures that y is a column vector.
for j = 2:n
  for i = 1:n-j+1
    b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
  end
end
xt = 1;
yint = b(1,1);
for j = 1:n-1
  xt = xt*(xx-x(j));
  yint = yint+b(1,j+1)*xt;
end
end