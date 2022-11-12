close all
clc
ans = -22/15;

ERR = [];
for n =4:14
t = legandre(n);
A = int_lagrange(t);
int = int_gauss(t,A,2);
ERR = [ERR abs(ans-int)];
end
N =4:1:14;

ERR1 = [];
ERR2 = [];
ERR3 = [];
EPS = [];
t8 = legandre(8);
A8 = int_lagrange(t8);
t2 = legandre(2);
A2 = int_lagrange(t2);
for i=1:8
    for k = 3^i
      eps = 10^(-i);
      int1 = int_gauss(t2,A2,k);
      int2 = int_te(k/3);
      int3 = int_gauss(t8,A8,k);
      ERR1 =[ERR1 abs(ans-int1)];
      ERR2 = [ERR2 abs(ans-int2)];
      ERR3 = [ERR3 abs(ans-int3)];
      EPS = [EPS eps];
    end
end

N1 =1:1:length(ERR1);
N2 =1:1:length(ERR2);
N3 = 1:1:length(ERR3);



EPS = [];
ERR_EPS = [];
for i = 1:10
   eps = 10^(-i);
   n = 2;
   INT1 = int_gauss(t2,A2,n);
   n = 2*n;
   INT2 = int_gauss(t2,A2,n);
   while abs(INT2-INT1)>7*eps
      INT1 = INT2;
      n=2*n;
      INT2 = int_gauss(t2,A2,n);
   end
   EPS = [EPS eps];
   ERR_EPS = [ERR_EPS abs(ans-INT2)];
end





figure ('Position', [10, 200, 400, 400]);
hold on
grid on
semilogy(N,ERR, '-*','linewidth',2)
legend('ERROR')
title ("Зависимость погрешности от выбора степени корневого полинома Лежандра")
xlabel ("Степень полинома(кол-во узлов)")
ylabel ("Погрешность")

figure ('Position', [420, 200, 700, 400]);
hold on
grid on
subplot(3,1,1)
semilogy(N1, ERR1, '-*', 'linewidth',2)
legend('ERROR1')
title ("Квадратурная формула Гаусса (n=2)")
xlabel ("Количество точек в разбиении (log3(N))")
ylabel ("Погрешность")
subplot(3,1,3)
semilogy(N2, ERR2, '-*', 'linewidth',2)
legend('ERROR2')
title ("Квадратурная формула 3/8")
xlabel ("Количество точек в разбиении (log3(N))")
ylabel ("Погрешность")

subplot(3,1,2)
plot(N3, ERR3, '-*', 'linewidth',2)
legend('ERROR3')
title ("Квадратурная формула Гаусса (n=8)")
xlabel ("Количество точек в разбиении (log3(N))")
ylabel ("Погрешность")

figure ('Position', [1130, 200,  400, 400]);
grid on
loglog (EPS,EPS, '--', 'linewidth',2)
hold on
loglog (EPS,ERR_EPS, '-*', 'linewidth',2)
title('Сравнение точностей');
legend ('Теоретическая точность','Фактическая точность','location','best')








