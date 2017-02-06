clear;
clc;
deltat=0.001;
sigma=10;
rho=28;
beta=8/3;
xnew=@(x, y) sigma*(y-x)*deltat+x;
ynew=@(x, y, z) (x*(rho-z)-y)*deltat+y;
znew=@(x, y, z) (x*y-beta*z)*deltat+z;
t=0:deltat:100;
x=double.empty;
y=double.empty;
z=double.empty;
x=cat(2, x, 1); %giving the functions the initial conditions
y=cat(2, y, 0.5);
z=cat(2, z, 0.3);
for counter=1:100/deltat
    x=cat(2, x, xnew(x(counter), y(counter)));
    y=cat(2, y, ynew(x(counter), y(counter), z(counter)));
    z=cat(2, z, znew(x(counter), y(counter), z(counter)));
end
