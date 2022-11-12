clear all
close all

f1 = @(x) x-sin(x);
f2 = @(x) 3*sign(x).*x.^4-8*x.^3-18*x.^2+6;

a = -1.3;
b = 1.05;

x = a:0.01:b;

n=45;

X = a+(0:n-1)*(b-a)/(n-1);

poly_1 = poly_fourier(X,f1,x);
poly_2 = poly_fourier(X,f2,x);

ERR_1 = abs(f1(x)-poly_1);
ERR_2 = abs(f2(x)-poly_2);


ERR1 = [];
ERR2 = [];
N = [];
for  n=5:10:55   
X1=Chebfunc(a,b,n);
poly_3 = poly_fourier(X1,f1,x);
poly_4 = poly_fourier(X1,f2,x);
ERR1= [ERR1 max(abs(f1(x)-poly_3))];
ERR2 = [ERR2  max(abs(f2(x)-poly_4))];
N = [N n];
end

ERR3 = [];
ERR4 = [];
NN = [];
for n=5:5:30   
X2=Gridfunc(a,b,n);
poly_5 = poly_fourier(X2,f1,x);
poly_6 = poly_fourier(X2,f2,x);
ERR3= [ERR3 max(abs(f1(x)-poly_5))];
ERR4 = [ERR4 max(abs(f2(x)-poly_6))];
NN = [NN length(X2)];
end


t1='$x - sin(x)$'
t2= '$3sign(x)x^{4}-8x^{3}-18x^{2}+6$';
%функции на равномерной сетке и их аппроксимация
figure('Position', [10, 400, 600, 300]);
subplot (2,1,1)
grid on
plot(x, f1(x),x,poly_1, X,f1(X),'k.')
grid on
legend("Точное решение","Аппроксимация", "Узлы")
ylabel (t1,'interpreter','latex')
title ("Аппроксимация функций на равномерной сетке при 45 узлах")
axis([-1.3 1.05 -1 1])

subplot (2,1,2)
grid on
plot(x, f2(x),x,poly_2, X,f2(X),'k.')
grid on
legend("Точное решение","Аппроксимация", "Узлы")
ylabel (t2,'interpreter','latex')
axis([-1.3 1.05 -40 20])

%ошибка аппроксимации от координаты на равномерной сетке
figure('Position', [620, 400, 600, 300])
subplot (2,1,1)
grid on
plot(x, ERR_1)
grid on
legend("Ошибка от координаты")
ylabel (t1,'interpreter','latex')
title("Зависимость ошибки от координаты при 45 узлах равномерной сетки")
axis ([-1.3 1.05 0 0.16])


subplot (2,1,2)
grid on
plot(x, ERR_2)
grid on
legend("Ошибка от координаты")
ylabel (t2,'interpreter','latex')
axis ([-1.3 1.05 0 14])

%максимальные ошибки при разных кол-вах узлов чебышевская сетка
figure('Position', [10, 0, 600, 300]);
subplot (2,1,1)
grid on
semilogy(N, ERR1)
grid on
legend("График ошибки")
ylabel (t1,'interpreter','latex')
title ('Зависимость ошибки от кол-ва узлов')

subplot (2,1,2)
grid on
semilogy(N, ERR2)
grid on
legend("График ошибки")
ylabel (t2,'interpreter','latex')
xlabel ("Чебышевская сетка")

%максимальные ошибки при разных кол-вах узлов сетка со сгущением
figure('Position', [620, 0, 600, 300]);
subplot (2,1,1)
grid on
semilogy(NN, ERR3)
grid on
legend("График ошибки")
ylabel (t1,'interpreter','latex')
title ('Зависимость ошибки от кол-ва узлов')

subplot (2,1,2)
grid on
semilogy(NN, ERR4)
grid on
legend("График ошибки")
ylabel(t2,'interpreter','latex')
xlabel ("Произвольна сетка со сгущением")


