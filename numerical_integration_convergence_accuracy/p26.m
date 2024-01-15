format long
n=[2,4,8,16,32,64];
I=[ 0.28451779686
 0.28559254576
 0.28570248748
 0.28571317731
 0.28571418363
 0.28571427643];
for j=1:length(n)-2
R(j)=(I(j+1)-I(j))/(I(j+2)-I(j+1));
end
for i=1:length(n)-2
    Ix1(i)=(R(i)*I(i+2)-I(i+1))/(R(i)-1);
end
for j=1:length(Ix1)-2
Rx1(j)=(Ix1(j+1)-Ix1(j))/(Ix1(j+2)-Ix1(j+1));
end
for i=1:length(Ix1)-2
    Ix2(i)=(Rx1(i)*Ix1(i+2)-Ix1(i+1))/(Rx1(i)-1);
end
for j=1:length(Ix2)-2
Rx2(j)=(Ix2(j+1)-Ix2(j))/(Ix2(j+2)-Ix2(j+1));
end
t=table(n',I,[nan(),nan(),R]',[nan(),nan(),Ix1,]',[nan(),nan(),nan(),nan(),Rx1]','VariableNames',["n","I(n)","R(n)","Iextrap","R of extrap"])