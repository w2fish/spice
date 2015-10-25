% 20151025
% purpose: test back-euler method
% 1D transient spice model
n = 1000;
R = 1e4;
C = 1e-6;
dt = 0.1e-3;
t = zeros(n,1);
vi = ones(n,1);
vb = zeros(n,1);
for i = 2 : n
  t(i) = t(i-1) + dt;
  vb(i) = (vb(i-1)*C/dt + vi(i)/R) / (1/R + C/dt);
end
plot(t,vi,t,vb);