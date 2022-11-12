function [X,D,G,Y]=diff_run(a,b,n,d_1, d_2)
alp = [1 1];
bet = [1 0];

D = [];
G=[];
Y=[];

h = (b-a)/n;
X=a+(0:n).*h;

A = alp(1)*tochnY(a)+alp(2)*d_tochnY(a);
B = bet(1)*tochnY(b)+bet(2)*d_tochnY(b);

D(1) = -d_1*alp(1)/alp(2);
G(1) = d_1*A/alp(2);

for i=1:n
    D(i+1)=D(i) - h*(p(X(i))*D(i) + d_2*(D(i))^2 + q(X(i)));
end

for i = 1:n
    G(i+1)=G(i)- h*((p(X(i)) + D(i))*d_2*G(i) - f(X(i))); 
end
 X = flip(X);
 G = flip(G);
 D = flip(D);
 Y(1)=(B-bet(2)*G(1))/(bet(1)+bet(2)*D(1));
 for i=1:n
     Y(i+1)=Y(i)-h*(D(i)*Y(i)+G(i));
 end
 Y=flip(Y);
 G=flip(G);
 D=flip(D);
 X=flip(X);

end