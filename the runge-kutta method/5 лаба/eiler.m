function [X,Y,h] = eiler(a,b,y0,n,d)
% a=1;
% b=2;
% y0 = tochnY(a);
% d = 1;
% 
% ERR = [];
% n=10;
h = (b-a)/n;
X=a+(0:n).*h;
Y = [];
Y(1)= y0;
T = [];
for i=1:n
    f_xy = f(X(i),Y(i),d)
    y_iter1 = Y(i)+h*f_xy;
    y_iter2 = Y(i)+h/2*(f_xy+f(X(i+1),y_iter1,d));
    y_iter3 = Y(i)+h/2*(f_xy+f(X(i+1),y_iter2,d));
    y_iter4 = Y(i)+h/2*(f_xy+f(X(i+1),y_iter3,d));
    Y(i+1)=y_iter4
% 
% y_iter1 = Y(i)+h*f(X(i),Y(i),d);
% y_iter2 = y_iter1+h/2*(f(X(i),y_iter1,d)+f(X(i+1),y_iter1,d));
% y_iter3 = y_iter2+h/2*(f(X(i),y_iter2,d)+f(X(i+1),y_iter2,d));
% y_iter4 = y_iter3+h/2*(f(X(i),y_iter3,d)+f(X(i+1),y_iter3,d));
% Y(i+1)=y_iter4
end
% for j=1:11
%       t = tochnY(X(j))
%     T = [T t];
% end
end