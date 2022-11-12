close all
clc
a=1;
b=2;
n1 = 100;
y0 = tochnY(a);


ERR = [];
for n=10:10:1000
  [X Y]= runge(a,b,y0,n,1);
  for i = 1:length(Y)
      err = max(abs(Y(i)-tochnY(X(i))));
  end
  ERR = [ERR err];
end
[X1,Y1] = runge(a,b,y0,n1,1);

[X2,Y2] = runge(a,b,y0,n1,1.01);
[X3,Y3] = runge(a,b,y0,n1,1.02);
[X4,Y4] = runge(a,b,y0,n1,1.03);


ERR2 = 100*norm(Y2-Y1)/norm(Y1);
ERR3 = 100*norm(Y3-Y1)/norm(Y1);
ERR4 = 100*norm(Y4-Y1)/norm(Y1);


ERR11=[ERR2 ERR3 ERR4]
DELTA=[1 2 3]

ERR1 = [];
for i= 1:length(X1)
    err1 = abs(tochnY(X1(i))-Y1(i));
    ERR1 = [ERR1 err1];
end

[X5,Y5] = runge(a,b,y0+0.01*y0,n1,1);
[X6,Y6] = runge(a,b,y0+0.02*y0,n1,1);
[X7,Y7] = runge(a,b,y0+0.03*y0,n1,1);


ERR5 = 100*norm(Y5-Y1)/norm(Y1);
ERR6 = 100*norm(Y6-Y1)/norm(Y1);
ERR7 = 100*norm(Y7-Y1)/norm(Y1);

ERR22=[ERR5 ERR6 ERR7]
DELTA=[1 2 3]

ERR_11 = [];
H_1 = [];
EPS_1 = [];
for i = 1:3
    n=4;
    [X_1,Y_1] = runge(a,b,n-1,y0);
    [X_1,Y] = runge(a,b,2*n-1,y0);
    eps = 10^(-i);
    h = vtor(Y);
    d = 1;
    [n,Y] = pravilo_runge(eps,Y,Y_1,h,n,a,b,y0,d);
    X = linspace(a,b,length(Y));
    Y_2 = tochnY(X);
        for k= 1:length(Y)
            err(k) = abs(Y(k)-Y_2(k));
        end
    err1 = max(err);
    ERR_11 = [ERR_11 err1];
    EPS_1 = [EPS_1 eps];
    h = (b-a)/n;
    H_1 = [H_1 h];
end



xx = a:0.001:b;
yy  = tochnY(xx);


figure ('Position', [10, 400, 400, 400]);
hold on
grid on
plot(X1,Y1,xx,yy,'--')
legend("Полученное решение", "Точное решение")
title("Решение при шаге интегрирования h=0.01")
xlabel ("Значения Х")
ylabel ("Значения f(x)")

figure ('Position', [420, 400, 400, 400]);
semilogy(X1,ERR1)
grid on
title("Ошибка при шаге интегрирования h=0.01 ")
xlabel ("Значения Х")
ylabel ("Значения погрешности")

figure ('Position', [830, 400, 400, 400]);
hold on
grid on
plot (DELTA, ERR11, "-*")
title ("Зависимость погрешности от внесения погрешности в числовые коэффициенты")
xlabel ("Значения возмущения,%")
ylabel ("Значения относительной погрешности,%")


figure ('Position', [10, 10, 400, 400])
hold on
grid on
plot (DELTA, ERR22, "-*")
title ("Зависимость погрешности от внесения погрешности в начальные условия")
xlabel ("Значения возмущения, % ")
ylabel ("Значения относительной погрешности, %")


p=10:10:1000;
for i =1:length(p)
    p(i)=1/p(i);
end

figure ('Position', [420, 10, 400, 400])
loglog(p,ERR)
grid on
title ("Зависимость погрешности от шага h")
legend ("ERR")
xlabel ("Шаг h")
ylabel ("Погрешность")

figure ('Position', [830, 10, 800, 400])
subplot (1,2,1)
loglog(EPS_1,EPS_1, EPS_1,ERR_11)
grid on
title ("Фактическая и теоретическая точность")
legend ("EPS", "ERR")
subplot(1,2,2)
loglog(EPS_1,H_1)
grid on
title ("Зависимость шага от требуемой точности")
xlabel ("Точность")
ylabel ("Шаг")








