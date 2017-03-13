%% Exercise 4 Step Size Controller
addpath('../')
tspan = [0; 50];
n = 1000;
y0 = [2; 0];
mu = 10;

abstol = 10e-6;
reltol = 10e-8;

%% Explicit Euler Adaptive Step
[T1,Y1] = ExplicitEuler_AdaptiveStep(...
        @VanderPolfunjac,tspan,n,y0,abstol,reltol,mu);

%% Implicit Euler Adaptive Step
[T2,Y2] = ImplicitEuler_AdaptiveStep(...
          @VanderPolfunjac,tspan,n,y0,abstol,reltol,mu);

%% Trapezoidal Adaptive Step
[T3,Y3] = Trapezoidal_AdaptiveStep(...
          @VanderPolfunjac,tspan,n,y0,abstol,reltol,'PI',mu);

plot(T1,Y1(:,1))
hold on
plot(T2,Y2(:,1))
plot(T3,Y3(:,1))      