close all
clc
a=1;
b=2;
n1 = 100;
y0 = tochnY(a);

n_1 = 1000;
n_2 = 2000;
[X_1 Y_1]=eiler(a,b,y0,n_1,1);
[X_2 Y_2]=eiler(a,b,y0, n_2,1);
y_1 = tochnY(X_1);
y_2 =tochnY(X_2);
ERR_1 =[];
ERR_2 = [];
for p=1:length(y_1)
ERR_1 = [ERR_1 abs(y_1(p)-Y_1(p))];
end
err_1 = max(ERR_1);
for p=1:length(y_2)
ERR_2 = [ERR_2 abs(y_2(p)-Y_2(p))];
end
err_2 = max(ERR_2);

poryadok = log2(err_1/err_2)

ERR = [];
for n=10:100:10000
  [X Y]= eiler(a,b,y0,n,1);
  for i = 1:length(Y)
      err = max(abs(Y(i)-tochnY(X(i))));
  end
  ERR = [ERR err];
end 

ERRr = [];
for n=10:100:10000
  [Xr Yr]= runge(a,b,y0,n,1);
  for i = 1:length(Yr)
      errr = max(abs(Yr(i)-tochnY(Xr(i))));
  end
  ERRr = [ERRr errr];
end

[X1,Y1] = eiler(a,b,y0,n1,1);
ERR1 = [];
for i= 1:length(X1)
    err1 = abs(tochnY(X1(i))-Y1(i));
    ERR1 = [ERR1 err1];
end

[X1r,Y1r] = runge(a,b,y0,n1,1);
ERR1r = [];
for i= 1:length(X1)
    err1r = abs(tochnY(X1r(i))-Y1r(i));
    ERR1r = [ERR1r err1r];
end


d1 = (2*0.01*rand-0.01)+1
d2 = (2*0.02*rand-0.02)+1
d3 = (2*0.03*rand-0.03)+1

[X2,Y2] = eiler(a,b,y0,n1,d1);
[X3,Y3] = eiler(a,b,y0,n1,d2);
[X4,Y4] = eiler(a,b,y0,n1,d3);

[X1r,Y1r] = runge(a,b,y0,n1,1);


[X2r,Y2r] = runge(a,b,y0,n1,d1);
[X3r,Y3r] = runge(a,b,y0,n1,d2);
[X4r,Y4r] = runge(a,b,y0,n1,d3);

ERR2 = 100*norm(Y2-Y1)/norm(Y1);
ERR3 = 100*norm(Y3-Y1)/norm(Y1);
ERR4 = 100*norm(Y4-Y1)/norm(Y1);

ERR2r = 100*norm(Y2r-Y1r)/norm(Y1r);
ERR3r = 100*norm(Y3r-Y1r)/norm(Y1r);
ERR4r = 100*norm(Y4r-Y1r)/norm(Y1r);


ERR11=[ERR2 ERR3 ERR4];
ERR11r=[ERR2r ERR3r ERR4r];
DELTA = [1 2 3];




[X5,Y5] = eiler(a,b,1.01*y0,n1,1);
[X6,Y6] = eiler(a,b,1.02*y0,n1,1);
[X7,Y7] = eiler(a,b,1.03*y0,n1,1);

[X5r,Y5r] = runge(a,b,1.01*y0,n1,1);
[X6r,Y6r] = runge(a,b,1.02*y0,n1,1);
[X7r,Y7r] = runge(a,b,1.03*y0,n1,1);

ERR5 = 100*norm(Y5-Y1)/norm(Y1);
ERR6 = 100*norm(Y6-Y1)/norm(Y1);
ERR7 = 100*norm(Y7-Y1)/norm(Y1);

ERR5r = 100*norm(Y5r-Y1r)/norm(Y1r);
ERR6r = 100*norm(Y6r-Y1r)/norm(Y1r);
ERR7r = 100*norm(Y7r-Y1r)/norm(Y1r);

ERR22=[ERR5 ERR6 ERR7];
ERR22r=[ERR5r ERR6r ERR7r];


ERR_11 = [];
H_1 = [];
EPS_1 = [];
for i = 1:2
    n=4;
    [X_1,Y_1] = eiler(a,b,n-1,y0);
    [X_1,Y] = eiler(a,b,2*n-1,y0);
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

poryadok = 2


xx = a:0.001:b;
yy  = tochnY(xx);


figure
subplot (1,2,1) 
hold on
grid on
plot(X1,Y1,xx,yy,'--')
legend("Полученное решение", "Точное решение")
title("Решение при шаге интегрирования h=0.01(Эйлер)")
xlabel ("Значения Х")
ylabel ("Значения f(x)")
subplot (1,2,2) 
hold on
grid on
plot(X1r,Y1r,xx,yy,'--')
legend("Полученное решение", "Точное решение")
title("Решение при шаге интегрирования h=0.01(Рунге)")
xlabel ("Значения Х")
ylabel ("Значения f(x)")


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


p=10:100:10000;
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

figure
subplot (1,2,1)
semilogy(X1,ERR1)
grid on
title("Ошибка при шаге интегрирования h=0.01 для метода Эйлера с итерационной обработкой")
xlabel ("Значения Х")
ylabel ("Значения погрешности")
subplot (1,2,2)
semilogy(X1r,ERR1r)
grid on
title("Ошибка при шаге интегрирования h=0.01 для Рунге-Кутты 3-го порядка")
xlabel ("Значения Х")
ylabel ("Значения погрешности")


figure
subplot (1,2,1)
loglog(p,ERR)
grid on
title ("Зависимость погрешности от шага h (Эйлер)")
legend ("ERR")
xlabel ("Шаг h")
ylabel ("Погрешность")
subplot (1,2,2)
loglog(p,ERRr)
grid on
title ("Зависимость погрешности от шага h(Рунге-Кутта)")
legend ("ERR")
xlabel ("Шаг h")
ylabel ("Погрешность")

figure ('Position', [830, 400, 400, 400]);
subplot (1,2,1)
hold on
grid on
plot (DELTA, ERR11, "-*")
title ("Зависимость погрешности от внесения погрешности в числовые коэффициенты(Эйлер)")
xlabel ("Значения возмущения,%")
ylabel ("Значения относительной погрешности,%")
subplot (1,2,2)
hold on
grid on
plot (DELTA, ERR11r, "-*")
title ("Зависимость погрешности от внесения погрешности в числовые коэффициенты(Рунге-Кутта)")
xlabel ("Значения возмущения,%")
ylabel ("Значения относительной погрешности,%")


figure
subplot (1,2,1)
hold on
grid on
plot (DELTA, ERR22, "-*")
title ("Зависимость погрешности от внесения погрешности в начальные условия")
xlabel ("Значения возмущения, % ")
ylabel ("Значения относительной погрешности, %")
subplot (1,2,2)
hold on
grid on
plot (DELTA, ERR22r, "-*")
title ("Зависимость погрешности от внесения погрешности в начальные условия")
xlabel ("Значения возмущения, % ")
ylabel ("Значения относительной погрешности, %")










