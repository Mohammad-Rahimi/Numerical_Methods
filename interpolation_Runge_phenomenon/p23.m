
x=linspace(-5,5,11)
for i= 1:length(x)
    y(i)=f(x(i));
end

x1=linspace(-5,5,1000)
for i=1:length(x1)
 yap(i)=Newtint(x,y,x1(i));
 yact(i)=f(x1(i));
y1(i)= abs(Newtint(x,y,x1(i))-f(x1(i)));
end
ff= figure()
plot (x1,yap)
hold on 
box on

plot(x1,yact)
xlabel('x','FontWeight','b')
ylabel('y','FontWeight','b')
legend('interpolation', 'actual function')
f2= figure()
plot(x1,y1)
xlabel('x','FontWeight','b')
ylabel('absolute error','FontWeight','b')

function yint  = Newtint(x,y,xx)
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
function y= f(x)
y=1/(1+x^2);
end