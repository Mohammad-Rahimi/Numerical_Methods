format long
v=0.5;
a=0;
b=1;
tf=1;
dt=0.001;
h=0.05;
x=a:h:b;
t=0:dt:tf;
u0=0;
u1=1;
r=v*dt/h^2;
m=length(x);
n=length(t);
u=zeros(n,m);
%% applying BC & initial conditions
u(1,:)=DD(x(1:end));
u(:,1)=u0;
u(:,m)=u1;
for j=1:n-1
for i=2:m-1
    u(j+1,i)=r*u(j,i+1)+(1-2*r)*u(j,i)+r*u(j,i-1);
end
end
for i=1:6
plot (x,u(200*(i-1)+1,:))
hold on 

end
hold on
xlabel('x');
ylabel('u','FontWeight','b');
legend('t=0s',...
        't=0.2s','t=0.4s',...
        't=0.6s','t=0.8s',"t=1s");  
title("temperature distribustion over time");
t=table(u(1,:)',u(201,:)',u(401,:)',u(601,:)',u(801,:)',u(1001,:)','VariableNames',["t=0s","t=0.2s","t=0.4s","t=0.6s","t=0.8s","t=1.0s"])
function y=DD(x)
y=x.^2;
end


