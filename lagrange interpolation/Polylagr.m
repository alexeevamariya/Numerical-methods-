%полином Лагранжа
function L = Polylagr(x,y,n)
x = [1 2 3];
y = [2 3 4];
n = 3
syms h
L1 =0;
for k=1:n
    p=1;
     for i=1:n
         if k~=i
             p= p*((h -x(i))/(x(k)-x(i)));
         end
     end
    L1=L1+y(k)*p;
end
L1 = simplify(L1);
coefs = sym2poly(L1);
L = @(tt) polyval(coefs,tt);
end

% function L = Polylagr(x,y,n)
% % x = [0 1 2]
% % y = [0 1 4]
% % n = 3
% syms t
% yy = 0;
% for i=1:n
%    poly = 1; 
%     for j=[1:i-1,i+1:n]
%         poly = poly.*(t-x(j))/(x(i)-x(j));
%     end
% yy = yy+y(i)*poly;
% end
% L = yy
% %L1 = simplify(L1)
% %coefs = sym2poly(L1);
% %L = @(tt) polyval(coefs,tt)
% end

