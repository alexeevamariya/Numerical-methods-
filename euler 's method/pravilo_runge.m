function [n,y] = pravilo_runge(eps,y,y1,h,n,a,b,y0,d)
 while norm(y1-h)>3*eps
     y1=y;
        [x1,y] = eiler(a,b,y0,2*length(y1)-1,d);
         h = vtor(y); 
 end
 n = length(y)
end
