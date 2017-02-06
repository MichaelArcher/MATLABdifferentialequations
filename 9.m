function Question9()
clear;
clc;
clf;
h=0.001;
x=double.empty;
y=double.empty;
z=double.empty;
 x=cat(2, x, 1); %giving the functions the initial conditions
 y=cat(2, y, 0.5);
 z=cat(2, z, 0.3);

for counter=1:100/h
    k1=functions(x(counter), y(counter), z(counter));
    k2=functions(x(counter)+h*k1(1)/2, y(counter)+h*k1(2)/2, z(counter)+h*k1(3)/2);
    k3=functions(x(counter)+h*k2(1)/2, y(counter)+h*k2(2)/2, z(counter)+h*k2(3)/2);
    k4=functions(x(counter)+h*k3(1), y(counter)+h*k3(2), z(counter)+h*k3(3));

     x=cat(2, x, x(counter)+h*(k1(1)+2*k2(1)+2*k3(1)+k4(1))/6);
 y=cat(2, y, y(counter)+h*(k1(2)+2*k2(2)+2*k3(2)+k4(2))/6);
 z=cat(2, z, z(counter)+h*(k1(3)+2*k2(3)+2*k3(3)+k4(3))/6);

end
plot (x, y);
xlabel('x(t)');
ylabel('y(t)');
end

function system=functions(x, y, z); %x, y, z are the initial values;
%system(1)=new value for x, %system(2)=new value for y, system(3)=new
%value for z
system(1)=y;
system(2)=z;
system(3)=-z-x-(10^(-9))*(exp(y/0.026)-1);
end
