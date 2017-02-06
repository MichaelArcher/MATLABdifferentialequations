clear;
clc;
deltat=0.001;
sigma=10-0.1;
rho=28+0.101;
beta=8/3+0.1;
xnew=@(x, y) sigma*(y-x)*deltat+x;
ynew=@(x, y, z) (x*(rho-z)-y)*deltat+y;
znew=@(x, y, z) (x*y-beta*z)*deltat+z;
t=0:deltat:100;
x=double.empty;
y=double.empty;
z=double.empty;
x=cat(2, x, 1); %giving the functions the initial conditions
y=cat(2, y, 0.5);
z=cat(2, z, 0.31);
for counter=1:100/deltat
    x=cat(2, x, xnew(x(counter), y(counter)));
    y=cat(2, y, ynew(x(counter), y(counter), z(counter)));
    z=cat(2, z, znew(x(counter), y(counter), z(counter)));
end
plot3(x(1), y(1), z(1), 'r');
axis ([min(x), max(x), min(y), max(y), min(z), max(z)]);
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
distance=sqrt((x(1)-x(100/deltat+1))^2+(y(1)-y(100/deltat+1))^2+(z(1)-z(100/deltat+1))^2);
hold all;
for counter=2:100/deltat
    plot3(x(counter), y(counter), z(counter), 'b');
end
plot3(x(100/deltat+1), y(100/deltat+1), z(100/deltat+1), 'k');
hold off;

