function [X,Y,h] = runge(a,b,y0,n,d)
    h = (b-a)/n;
    X=a+(0:n).*h;
    Y(1) = y0;
    for i = 1:n
       k1 = f(X(i),Y(i),d);
       k2 = f( X(i) + h/2 , Y(i) + h * k1/2,d);
       k3 = f( X(i) + h , Y(i) - h * k1 + 2 * h * k2,d);
       Y(i+1) = Y(i) + h/6*(k1 + 4*k2 + k3); 
    end
  
end