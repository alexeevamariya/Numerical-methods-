a=-1.3
b=1.05
x = [-1.3 -0.9 0.14 0.53 0.8 1.05]
f1 = @(x) x-sin(x)
f2 = @(x) 3.*sign(x).*x.^4-8.*x.^3-18.*x.^2+6
% f1 = @(x) sin(x)-cos(5*x)
% f2 = @(x) tan(x)
y1 = f1(x)
y2=f2(x)

% %просто графики 
n = length(x)
yy1 =Polylagr(x,y1,n);
yy2 =Polylagr(x,y2,n);
figure
hold on
subplot(2,1,1)
fplot(f1, [a b], 'r')
hold on
plot(x,y1,'g')
plot(x,y1,'k.')
ylabel ('f1', 'rotation', 0)
xlabel ('Заданный интервал')
legend ('Исходная функция', 'Полином Лагранжа','Узлы', 'Location', 'South')

subplot(2,1,2)
fplot(f2, [a b], 'r')
hold on
plot(x,y2, 'g')
plot(x,y2,'k.')
ylabel ('f2', 'rotation', 0)
legend ('Исходная функция', 'Полином Лагранжа','Узлы', 'Location', 'South')
xlabel ('Заданный интервал')



%Иссл кол-во узлов чеб сетка
ERR1 = [];
ERR2 = [];
N = [];
l = linspace (a,b,1000);
for  n=5:10:55   
xx=Chebfunc(a,b,n);
y1=f1(xx);
y2=f2(xx);
L1 =Polylagr(xx,y1,n);
L2=Polylagr(xx,y2,n);
err1 = max(abs(f1(l)-L1(l)));
err2 = max(abs(f2(l)-L2(l)));
ERR1= [ERR1 err1]
ERR2 = [ERR2 err2]
N = [N n]
end
 

figure
hold on
grid on
subplot (2,1,1)
semilogy(N,ERR1, 'g-*')
ylabel ('Ошибка интерполяции')
t1='$x - sin(x)$'
title('Исследование зависимости ошибки интерполяции от количества узлов в Чебышевской сетке')
legend (t1,'interpreter','latex','Location', 'Best')
subplot(2,1,2)
semilogy(N,ERR2,'b-*')
t2= '$3sign(x)x^{4}-8x^{3}-18x^{2}+6$';
legend(t2,'interpreter','latex','Location', 'Best')
xlabel ('Количество узлов Чебышевской сетки')
ylabel ('Ошибка интерполяции (максимальная)')


%Иссл кол-во узлов произвольная сетка со сгущением
ERR1 = []
ERR2 = []
N = []
for n=5:5:30   
xx=Gridfunc(a,b,n)
L1 =Polylagr(xx,y1,n);
L2=Polylagr(xx,y2,n);
err1 = max(abs(f1(l)-L1(l)));
err2 = max(abs(f2(l)-L2(l)));
ERR1= [ERR1 err1]
ERR2 = [ERR2 err2]
N = [N length(xx)]
end
figure
hold on
grid on
subplot (2,1,1)
semilogy(N,ERR1, 'g-*')
ylabel ('Ошибка интерполяции')
t1='$x - sin(x)$'
title('Исследование зависимости ошибки интерполяции от количества узлов в произвольной сетке')
legend (t1,'interpreter','latex','Location', 'Best')
subplot(2,1,2)
semilogy(N,ERR2,'b-*')
t2= '$3sign(x)x^{4}-8x^{3}-18x^{2}+6$';
legend(t2,'interpreter','latex','Location', 'Best')
xlabel ('Количество узлов произвольной сетки')
ylabel ('Ошибка интерполяции (максимальная)')



%гладкость функции

a=-1.3
b=1.05
n=10
p= 0
l = linspace (a,b,100);
xx1= Chebfunc(a,b,n);
f1 = @(x) x-sin(x)
f2 = @(x) 3.*sign(x).*x.^4-8.*x.^3-18.*x.^2+6
y1=f1(xx1)
y2=f2(xx1)
l = [l xx1];
l =unique(sort(l));
LL1 =Polylagr(xx1,y1,n);
LL2=Polylagr(xx1,y2,n);
err1 = abs(f1(l)-LL1(l));
err2 = abs(f2(l)-LL2(l));
figure
hold on
grid on
 yyaxis left
semilogy(l,err1)
 yyaxis right
semilogy(l,err2)
semilogy(xx1,p,'k*')
xlabel ('Узлы сетки Чебышева')
title ('Исследование ошибки интерполяции для гладкой и негладкой функций')
legend('гладкая', 'негладкая', 'заданные узлы')

a=-1.3
b=1.05
n=10
p= 0
l = linspace (a,b,100);
xx1=Gridfunc(a,b,n);
f1 = @(x) x-sin(x)
f2 = @(x) 3.*sign(x).*x.^4-8.*x.^3-18.*x.^2+6
y1=f1(xx1)
y2=f2(xx1)
l = [l xx1];
l =unique(sort(l));
n = length(xx1)
LL1 =Polylagr(xx1,y1,n);
LL2=Polylagr(xx1,y2,n);
err1 = abs(f1(l)-LL1(l));
err2 = abs(f2(l)-LL2(l));
figure
hold on
grid on
yyaxis left
semilogy(l,err1)
yyaxis right
semilogy(l,err2)
semilogy(xx1,p,'k*')
xlabel ('Узлы произвольной сетки')
title ('Исследование ошибки интерполяции для гладкой и негладкой функций')
legend('гладкая', 'негладкая', 'заданные узлы')










