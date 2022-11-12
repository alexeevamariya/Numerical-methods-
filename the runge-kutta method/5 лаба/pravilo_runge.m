function [n,y] = pravilo_runge(eps,y,y1,h,n,a,b,y0,d)
 while norm(y1-h)>7*eps
     y1=y;
        [x1,y] = runge(a,b,y0,2*length(y1)-1,d);
         h = vtor(y); 
 end
 n = length(y)
end

% function [ERR,H,EPS] = pravilo_runge(eps)
%     ERR = [];
%     H = [];
%     EPS = [];
%     n=2;
%     a=1;
%     b=2;
%     y0 = tochnY(a);
%     [X_1 Y_1] = runge(a,b,y0,n,1);
%     x = linspace (a,b,n+1);
%     y = tochnY(x);
%     while norm(Y_1-y)>eps
%         [X_1 Y_1] = runge(a,b,y0,2*n,1);
%         n = 2*n;
%         x = linspace (a,b,n+1);
%         y = tochnY(x);
%     end
%     ERR = [ERR norm(Y_1-y)];
%     EPS = [EPS eps];
%     h = (b-a)/n;
%     H = [H h];
% end

