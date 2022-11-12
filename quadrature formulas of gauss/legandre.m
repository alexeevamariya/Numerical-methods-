function t = legandre(n)
syms x  
P_0 = 1;
P_1 = x;
P_i = 0;
for i=2:n
    P_i = (2*i-1)/i*x*P_1-(i-1)/i*P_0;
    P_0 = P_1;
    P_1 = P_i;
end
polynom = P_i;
t = solve(polynom, x);
t = double(t);
end

