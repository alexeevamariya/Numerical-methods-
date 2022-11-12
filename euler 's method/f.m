function dY = f(x,y,d)
 %dY=(d*x.^2+1)+(2*x*y)/(x.^2+1); %[0;2]
  %dY = (x^2+y^3)/(x*y^2);[1;2]
  dY = 2.*x*(d.*x.^2+y); %[1;2]
 %dY=d*sec(x)-y*tan(x); отрезок [0;1.5]
end