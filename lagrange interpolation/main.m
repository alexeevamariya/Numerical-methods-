a = -1.3;
b = 1.05;
f = @(x) x-sin(x);

for n = 6:2:10
    X = [];
    Y = [];
    L = [];
    for i = 1:n
        t = cos(pi*(2*i+1)/2/(n+1));
        X = [X (a+b)/2+(b-a)/2*t];
        Y = [Y f(X(i))];
        
    end
    for i = 1:n
        L = [L Lagrange(X(i),X,Y)];
    end
    
end



















