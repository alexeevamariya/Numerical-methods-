close all
clc
a = -1;
b = 1;
ans = -22/15;


err = 0
ERR = []
NN= []
for j =2:10
   for N = 2^j
        INT = int(N);
        err = abs(INT - ans);
        ERR = [ERR err];
        NN = [NN N];
   end
end

ERR_EPS = [];
ERR_EPS1 = [];
EPS = [];
ITER = [];
ITER1 = [];
for i = 1:8
   eps = 10^(-i);
   n = 2;
   INT1 = int(a,b,n);
   n = 2*n;
   INT2 = int(a,b,n);
   while abs(INT2-INT1)>15*eps
      INT1 = INT2;
      n=2*n;
      INT2 = int(a,b,n);
   end
   EPS = [EPS eps];
   ERR_EPS1 = [ERR_EPS1 abs(ans-INT1)]
   ERR_EPS = [ERR_EPS abs(ans-INT2)];
   ITER = [ITER log2(n)];
end


EPS_p = ERR_EPS
for i=1:length(ERR_EPS)
   EPS_p(i)=log2(ceil(ERR_EPS1(i)/ERR_EPS(i)))
end
P=1:1:length(EPS_p)

figure('Position', [10, 100, 400, 400]);
grid on
semilogy(NN,ERR,'-*b', 'Linewidth', 2)
legend ('ERROR')
title ('Зависимость погрешности от измельчения шага')
xlabel ('Количество точек в измельчении')
ylabel ('Погрешность')

figure ('Position', [400, 100, 400, 400]);
grid on
loglog (EPS,EPS, '--', 'linewidth',2)
hold on
loglog (EPS,ERR_EPS, '-*', 'linewidth',2)
title('Сравнение точностей');
legend ('Теоретическая точность','Фактическая точность','location','best')

figure('Position', [800, 100, 400, 400]);
semilogx (EPS,ITER,'-*','linewidth',2 )
grid on
xlabel ('Точность')
ylabel ('Степень измельчения (log2(n))')
title('Влияние точности на количество вычислений')

figure('Position', [1200, 100, 400, 400]);
plot (EPS_p,P,'-*','linewidth',2 )
grid on
xlabel ('Отношение точностей (log2(err1/err2))')
ylabel ('Номера отношений значений погрешности')
title('Исследование порядка точности')




