function system=lorenz(t, xyz); %xyz(1) is x, xyz(2) is y, xyz(3) is z
%system(1)=dx/dt, %system(2)=dy/dt, system(3)=dz/dt
%system(2)=dy/dt
sigma=10;
rho=28;
beta=8/3;
system(1)=sigma*(xyz(2)-xyz(1));
system(2)=xyz(1)*(rho-xyz(3))-xyz(2);
system(3)=xyz(1)*xyz(2)-beta*xyz(3);
system=transpose(system);
end
