close all
a = 0.2;
b=1;

[X_1,D_1,G_1,Y_1]= diff_run(a,b,10,1,1);
[X_2,D_2,G_2,Y_2]= diff_run(a,b,20,1,1);
[X_3,D_3,G_3,Y_3]=diff_run(a,b,100,1,1);
[X_4,D_4,G_4,Y_4]=diff_run(a,b,1000,1,1); %работа метода для разных шагов


x = linspace(a,b,100);
y = tochnY(x);


ERR_1=[];
for i =1:length(Y_1)
  ERR_1 = [ERR_1 abs(Y_1(i)-tochnY(X_1(i)))];
end

ERR_2=[];
for i =1:length(Y_2)
  ERR_2 = [ERR_2 abs(Y_2(i)-tochnY(X_2(i)))];
end

ERR_3=[];
for i =1:length(Y_3)
  ERR_3 = [ERR_3 abs(Y_3(i)-tochnY(X_3(i)))];
end

ERR_4=[];
for i =1:length(Y_4)
  ERR_4 = [ERR_4 abs(Y_4(i)-tochnY(X_4(i)))];
end
% ERR_1 = flip(ERR_1);
% ERR_2=flip(ERR_2);
% ERR_3=flip(ERR_3);
% ERR_4=flip(ERR_4);
%ошибка для разных шагов



for i =1:length(Y_1)
err = max(abs(Y_1(i)-tochnY(X_1(i))));
end

for i=1:length(Y_2)
err_1 =  max(abs(Y_2(i)-tochnY(X_2(i))));
end
poryadok = log2((ceil(err/err_1))) %определение порядка метода


d1 = (2*0.01*rand-0.01)+1;
d2 = (2*0.02*rand-0.02)+1;
d3 = (2*0.03*rand-0.03)+1;

[X2,D2,G2,Y2] = diff_run(a,b,1000,d1,1);
[X3,D3,G3,Y3] = diff_run(a,b,1000,d2,1);
[X4,D4,G4,Y4] = diff_run(a,b,1000,d3,1);


[X5,D5,G5,Y5] =diff_run(a,b,1000,1,d1);
[X6,D6,G6,Y6] =diff_run(a,b,1000,1,d2);
[X7,D7,G7,Y7] =diff_run(a,b,1000,1,d3);

ERR2 = 100*norm(Y2-Y_4)/norm(Y_4);
ERR3 = 100*norm(Y3-Y_4)/norm(Y_4);
ERR4 = 100*norm(Y4-Y_4)/norm(Y_4);

ERR5 = 100*norm(Y5-Y_4)/norm(Y_4);
ERR6 = 100*norm(Y6-Y_4)/norm(Y_4);
ERR7 = 100*norm(Y7-Y_4)/norm(Y_4);



ERR11=[ERR2 ERR3 ERR4];
ERR11r=[ERR5 ERR6 ERR7];
DELTA = [1 2 3];

ERR_11 = [];
EPS_1=[];
H_1 =[];
for i = 1:2
    n=4;
    [Xr1,Dr1,Gr1,Yr1] = diff_run(a,b,n-1,1,1);
    [Xr2,D2r,Gr2,Yr2] = diff_run(a,b,2*n-1,1,1);
    eps = 10^(-i);
    Yr2_sort = delete_second(Yr2);
    [n,Y] = pravilo_runge(eps,Yr2,Yr1,Yr2_sort,n,a,b);
    X = linspace(a,b,length(Y));
    Y_tochn = tochnY(X);
        for k= 1:length(Y)
            err(k) = abs(Y(k)-Y_tochn(k));
        end
    err1 = max(err);
    ERR_11 = [ERR_11 err1];
    EPS_1 = [EPS_1 eps];
    h = (b-a)/n;
    H_1 = [H_1 h];
end

figure('Position', [10, 200, 500, 400]);
subplot(2,1,1)
plot( X_1,Y_1, X_2, Y_2, X_3,Y_3, X_4,Y_4,x,y,'--')
legend ('n=10','n=20','n=100','n=1000','y(x)')
title ('Графики решений при различных шагах')
subplot(2,1,2)
semilogy (X_1,ERR_1, X_2,ERR_2, X_3,ERR_3, X_4,ERR_4)
legend('n=10','n=20','n=100','n=1000')
title ('Ошибка от координаты при различных n')
 
figure ('Position', [510, 200, 500, 400]);
subplot(2,1,1)
plot(DELTA, ERR11)
title ('Влияние возмущения в начальных условиях на относительную погрешность,%')
subplot(2,1,2)
plot(DELTA, ERR11r)
title ('Влияние возмущения в коэффициентах на относительную погрешность,%')


figure('Position', [1020, 200, 500, 400]);
subplot(2,1,1)
loglog(EPS_1,EPS_1, EPS_1,ERR_11)
grid on
title ("Фактическая и теоретическая точность")
legend('Теоретическая','Фактическая')
subplot(2,1,2)
loglog(EPS_1,H_1)
grid on
title ("Зависимость шага от требуемой точности")
xlabel ("Точность")
ylabel ("Шаг")
