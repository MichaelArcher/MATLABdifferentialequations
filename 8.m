function  Question8()
clear;
clc;
clf;
initialconditions=[1, 0.5, 0.3];
[TOUT, YOUT]=ode45(@lorenz, ([0, 100]), initialconditions);
h=0.001;
x=double.empty;
y=double.empty;
z=double.empty;
x=cat(2, x, 1); %giving the functions the initial conditions
y=cat(2, y, 0.5);
z=cat(2, z, 0.3);
[TOUT, YOUT]=ode45(@lorenz, ([0:h:100]), initialconditions);
for counter=1:100/h
    k1=lorenz2(x(counter), y(counter), z(counter));
    k2=lorenz2(x(counter)+h*k1(1)/2, y(counter)+h*k1(2)/2, z(counter)+h*k1(3)/2);
    k3=lorenz2(x(counter)+h*k2(1)/2, y(counter)+h*k2(2)/2, z(counter)+h*k2(3)/2);
    k4=lorenz2(x(counter)+h*k3(1), y(counter)+h*k3(2), z(counter)+h*k3(3));
    x=cat(2, x, x(counter)+h*(k1(1)+2*k2(1)+2*k3(1)+k4(1))/6);
y=cat(2, y, y(counter)+h*(k1(2)+2*k2(2)+2*k3(2)+k4(2))/6);
z=cat(2, z, z(counter)+h*(k1(3)+2*k2(3)+2*k3(3)+k4(3))/6);
end

absolutedifferencex=abs(x-transpose((YOUT(:,1))));
absolutedifferencey=abs(y-transpose((YOUT(:,2))));
absolutedifferencez=abs(z-transpose((YOUT(:,3))));

plot(TOUT, absolutedifferencex);

hold all;

plot(TOUT, absolutedifferencey);
plot(TOUT, absolutedifferencez);
xlabel('t');
ylabel('Difference');
title('Difference in results between Runge-Kutta and ode45');
legend ('difference in x(t)', 'difference in y(t)', 'difference in z(t)');

hold off;

end

function system=lorenz(t, xyz); %xyz(1) is x, xyz(2) is y, xyz(3) is z
%system(1)=dx/dt, %system(2)=dy/dt, system(3)=dz/dt
sigma=10;
rho=28;
beta=8/3;
system(1)=sigma*(xyz(2)-xyz(1));
system(2)=xyz(1)*(rho-xyz(3))-xyz(2);
system(3)=xyz(1)*xyz(2)-beta*xyz(3);
system=transpose(system);
end

function system=lorenz2(x, y, z); %x, y, z are the initial values;
%system(1)=new value for x, %system(2)=new value for y, system(3)=new
%value for z
sigma=10;
rho=28;
beta=8/3;
system(1)=sigma*(y-x);
system(2)=x*(rho-z)-y;
system(3)=x*y-beta*z;
end
