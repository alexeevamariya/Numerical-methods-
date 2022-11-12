function [n,y] = pravilo_runge(eps,y,y1,h,n,a,b)
 while norm(y1-h)>eps
     y1=y;
        [x1,d,g,y] = diff_run(a,b,2*length(y1)-1,1,1);
         h = delete_second(y); 
 end
 n = length(y)
end
