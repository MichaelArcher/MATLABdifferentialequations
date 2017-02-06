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
initialconditions=[1, 0.5, 0.3];
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
[TOUT, YOUT]=ode45(@lorenz, ([0:deltat:100]), initialconditions);
absolutedifferencex=abs(x-transpose((YOUT(:,1))));
absolutedifferencey=abs(y-transpose((YOUT(:,2))));
absolutedifferencez=abs(z-transpose((YOUT(:,3))));


maxfirstgraph=(max(x));
maxfirstgraph=cat(2, maxfirstgraph, max(y));
maxfirstgraph=cat(2, maxfirstgraph, max(z));
maxfirstgraph=max(maxfirstgraph);

maxsecondgraph=max(YOUT(:,1));
maxsecondgraph=cat(2, maxsecondgraph, max(YOUT(:,2)));
maxsecondgraph=cat(2, maxsecondgraph, max(YOUT(:,3)));
maxsecondgraph=max(maxsecondgraph);

maxthirdgraph=(max(absolutedifferencex));
maxthirdgraph=cat(2, maxthirdgraph, max(absolutedifferencey));
maxthirdgraph=cat(2, maxthirdgraph, max(absolutedifferencez));
maxthirdgraph=max(maxthirdgraph);

minfirstgraph=(min(x));
minfirstgraph=cat(2, minfirstgraph, min(y));
minfirstgraph=cat(2, minfirstgraph, min(z));
minfirstgraph=min(minfirstgraph);

minsecondgraph=min(YOUT(:,1));
minsecondgraph=cat(2, minsecondgraph, min(YOUT(:,2)));
minsecondgraph=cat(2, minsecondgraph, min(YOUT(:,3)));
minsecondgraph=min(minsecondgraph);

minthirdgraph=(min(absolutedifferencex));
minthirdgraph=cat(2, minthirdgraph, min(absolutedifferencey));
minthirdgraph=cat(2, minthirdgraph, min(absolutedifferencez));
minthirdgraph=min(minthirdgraph);

subplot(3, 1, 1);
axis([0 max(t) minfirstgraph maxfirstgraph]);
plot(t, x);
hold all;
plot(t, y);
plot(t, z);
xlabel ('t');
ylabel ('Function output');
title ('x(t), y(t), and z(t), as estimated by the method of Euler');
legend('x(t)', 'y(t)', 'z(t)');
hold off;
subplot(3, 1, 2);
axis([0 max(t) minsecondgraph maxsecondgraph]);
plot (TOUT, YOUT(:, 1));
hold all;
plot (TOUT, YOUT(:, 2));
plot (TOUT, YOUT(:, 3));
legend('x(t)', 'y(t)', 'z(t)');
xlabel ('t');
ylabel ('Function output');
title ('x(t), y(t), and z(t), as estimated ode45');
hold off;
subplot(3, 1, 3);
axis([0 max(t) minthirdgraph maxthirdgraph]);
plot(TOUT, absolutedifferencex);
hold all;
plot(TOUT, absolutedifferencey);
plot(TOUT, absolutedifferencez);
legend('Absolute difference x(t)', 'Absolute difference y(t)', 'Absolute difference z(t)');
xlabel ('t');
ylabel ('Function output');
title ('Absolute error between the first and second graphs');
hold off;
