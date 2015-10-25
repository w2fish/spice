% 20151025
% purpose: test back-euler method
% 2D transient spice model
n = 1000;
R1 = 1e4;
R2 = 1e4;
R3 = 1e4;
C1 = 2e-6;
C2 = 2e-6;
dt = 1e-4;
t = zeros(1,n);
v1 = ones(1,n);
v2 = 0.5 * ones(1,n);
% va = zeros(1,n);
% vb = zeros(1,n);
vo = zeros(2,n);
a = zeros(2,2);
a(1,1) = 1/R1 + 1/R2 + C1/dt;
a(1,2) = -1/R2;
a(2,1) = -1/R2;
a(2,2) = 1/R3 + 1/R2 + C2/dt;
for i = 2 : n
  t(i) = t(i-1) + dt;
  temp = vo(:, i-1);
  temp(1) = temp(1)*C1/dt + v1(i)/R1;
  temp(2) = temp(2)*C2/dt + v2(i)/R3;
  vo(:,i) = a \ temp;
end
figure,plot(t,vo(1,:),t,vo(2,:));