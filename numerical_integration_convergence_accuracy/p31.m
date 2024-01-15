% trapizoidal integration:
format long
b=2*pi;
a=0;
n=[2,4,8,16,32,64,128,256,512];
for i=1:length(n)
h=(b-a)/n(i);
nn=n(i);
x=linspace(a,b,n(i)+1);
y=f(x);
trpz(i) = (y(1)+2*sum(y(2:nn))+y(nn+1))*(h/2);
x=[];
y=[];
end
for j=1:length(n)-2
R(j)=(trpz(j+1)-trpz(j))/(trpz(j+2)-trpz(j+1));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:length(trpz)-1
    Ix1(i)=(4*trpz(i+1)-trpz(i))/(4-1);
end
for i=1:length(Ix1)-1
    Ix2(i)=(16*Ix1(i+1)-Ix1(i))/(16-1);
end
for i=1:length(Ix2)-1
    Ix3(i)=(2^6*Ix2(i+1)-Ix2(i))/(2^6-1);
end
for i=1:length(Ix3)-1
    Ix4(i)=(2^8*Ix3(i+1)-Ix3(i))/(2^8-1);
end
for i=1:length(Ix4)-1
    Ix5(i)=(2^10*Ix4(i+1)-Ix4(i))/(2^10-1);
end
for i=1:length(Ix5)-1
    Ix6(i)=(2^12*Ix5(i+1)-Ix5(i))/(2^12-1);
end
for i=1:length(Ix6)-1
    Ix7(i)=(2^14*Ix6(i+1)-Ix6(i))/(2^14-1);
end
for i=1:length(Ix7)-1
    Ix8(i)=(2^16*Ix7(i+1)-Ix7(i))/(2^16-1);
end
syms x
expr = 1./(2+cos(x));
It = double(int(expr,[a b]))
er=It-trpz;
er1=It-Ix1;
er2=It-Ix2;
er3=It-Ix3;
er4=It-Ix4;
er5=It-Ix5;
er6=It-Ix6;
er7=It-Ix7;
er8=It-Ix8;



t=table(n',trpz',[nan(),Ix1]',[nan(),nan(),Ix2]',[nan(),nan(),nan(),Ix3]',[nan(),nan(),nan(),nan(),Ix4]',... 
    [nan(),nan(),nan(),nan(),nan(),Ix5]',[nan(),nan(),nan(),nan(),nan(),nan(),Ix6]',...
    [nan(),nan(),nan(),nan(),nan(),nan(),nan(),Ix7]',...
    [nan(),nan(),nan(),nan(),nan(),nan(),nan(),nan(),Ix8]',...
    'VariableNames',["n","I(n)","I1","I2","I3","I4","I5","I6","I7","I8",])

t=table(n',er',[nan(),er1]',[nan(),nan(),er2]',[nan(),nan(),nan(),er3]',[nan(),nan(),nan(),nan(),er4]',... 
    [nan(),nan(),nan(),nan(),nan(),er5]',[nan(),nan(),nan(),nan(),nan(),nan(),er6]',...
    [nan(),nan(),nan(),nan(),nan(),nan(),nan(),er7]',...
    [nan(),nan(),nan(),nan(),nan(),nan(),nan(),nan(),er8]',...
    'VariableNames',["n","erI(n)","er(I1)","er(I2)","er(I3)","er(I4)","er(I5)","er(I6)","er(I7)","er(I8)",])
function y=f(x)
%y=exp(-x.^2);
%y=x.^(2.5);
%y = 1./(1+x.^2);
y=1./(2+cos(x));
%y=exp(x).*cos(4*x);
end
