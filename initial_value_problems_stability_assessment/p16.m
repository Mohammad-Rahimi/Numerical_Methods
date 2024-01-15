%mid_point
h=0.00001;
a=0;
b=200;
y(1)=1;
x=linspace(a,b,(b-a)/h);
y(2)=y(1)+h*f(x(1),y(1));
for i=1:length(x)-2
y(i+2)=y(i)+2*h*f(x(i+1),y(i+1));
end
yy=ff(x);
plot(x,y);
hold on
plot(x,yy)
xlabel('x');
ylabel('y');
legend("mid-point", "exact");


function yprime=f(x,y)
%yprime=-y.^2;
yprime=(y./4).*(1-y./20);
%yprime=-y+2.*cos(x);
%yprime=y-2.*sin(x);
end
function y=ff(x)
%y=1./(1+x);
y=20./(1+19.*exp(-x./4));
%y=cos(x)+sin(x);
%y=cos(x)+sin(x);
end

