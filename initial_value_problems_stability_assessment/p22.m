format long
%fourth-order Adams-Moulton
h=[0.5,0.25];
a=0;
b=5;
y(1)=1;
y2(1)=1;

x=a:h(1):b;
y(2)=ff(x(2));
y(3)=ff(x(3));
y(4)=ff(x(4));

for i=1:length(x)-4
y(i+4)=y(i+3)+(h(1)/24)*(55*f(x(i+3),y(i+3))-59*f(x(i+2),y(i+2))+37*f(x(i+1),y(i+1))-9*f(x(i),y(i)));
y(i+4)=y(i+3)+(h(1)/24)*(9*f(x(i+4),y(i+4))+19*f(x(i+3),y(i+3))-5*f(x(i+2),y(i+2))+f(x(i+1),y(i+1)));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x2=a:h(2):b;
y2(2)=ff(x2(2));
y2(3)=ff(x2(3));
y2(4)=ff(x2(4));
for i=1:length(x2)-4
y2(i+4)=y2(i+3)+(h(2)/24).*(55*f(x2(i+3),y2(i+3))-59*f(x2(i+2),y2(i+2))+37*f(x2(i+1),y2(i+1))-9*f(x2(i),y2(i)));
y2(i+4)=y2(i+3)+(h(2)/24).*(9*f(x2(i+4),y2(i+4))+19*f(x2(i+3),y2(i+3))-5*f(x2(i+2),y2(i+2))+f(x2(i+1),y2(i+1)));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yy=ff(x);
yy2=ff(x2);
er=yy-y;
er2=yy2-y2;

t=table(x',y',er','VariableNames',["x for h=0.5","y","error"])
t2=table(x2',y2',er2','VariableNames',["x for h=0.25","y","error"])
function yprime=f(x,y)
%yprime=-y.^2;
%yprime=(y./4).*(1-y./20);
%yprime=-y+2.*cos(x);
yprime=y-2.*sin(x);
end
function y=ff(x)
%y=1./(1+x);
%y=20./(1+19.*exp(-x./4));
%y=cos(x)+sin(x);
y=cos(x)+sin(x);
end

