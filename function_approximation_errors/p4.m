x=linspace(-1,1,1000)
p1=pi/2*x
p3=pi/2*x-((pi/2)^3)*x.^3
p5=pi/2*x-((pi/2)^3)*x.^3+((pi/2)^5)*x.^5
y=sin((pi/2)*x)
e1=abs(y-p1);
e3=abs(y-p3);
e5=abs(y-p5);
plot(x,e1)
hold on 
plot(x,e3)
hold on 
plot(x,e5)
xlabel('x')
ylabel('absolute error')
legend("e(p1)","e(p3)","e(p5)")
f=figure()
plot(x,p1)
hold on 
plot(x,p3)
hold on 
plot(x,p5)
hold on 
plot(x,y)