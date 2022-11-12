function [X,Y,h] = eiler(a,b,y0,n,d)
h = (b-a)/n;
X=a+(0:n).*h;
Y = [];
Y(1)= y0;
for i=1:n
    f_xy = f(X(i),Y(i),d);
    y_iter1 = Y(i)+h*f_xy;
    y_iter2 = Y(i)+h/2*(f_xy+f(X(i+1),y_iter1,d));
    y_iter3 = Y(i)+h/2*(f_xy+f(X(i+1),y_iter2,d));
    y_iter4 = Y(i)+h/2*(f_xy+f(X(i+1),y_iter3,d));
    Y(i+1)=y_iter4;
end
end