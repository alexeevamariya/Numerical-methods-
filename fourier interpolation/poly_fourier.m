function polynom = poly_fourier(X,f,t)
    q0 = 1;
    n = 15;
    q = cell(n,1);
    q{1} = @(x) x - 1/(n+1)*sum(X);
    c = [];
    c(1) = 1/(n+1)*sum(f(X));
    a = [];
    a(1) = 1/(n+1)*sum(X);
    
    a(2) = sum(X.*(q{1}(X)).^2)/sum((q{1}(X)).^2);
    b(1) = sum(X.*q{1}(X));
    q{2} = @(x) x.*q{1}(x)-a(2)*q{1}(x)-b(1)*q0;
    c(2) = sum(q{2}(X).*f(X))/sum((q{2}(X)).^2);
    
    for i = 2:n-1
        a(i+1) = sum(X.*(q{i}(X)).^2)/sum((q{i}(X)).^2);
        b(i) = sum(X.*q{i}(X).*q{i-1}(X))/sum((q{i-1}(X)).^2);
        q{i+1} = @(x) x.*q{i}(x)-a(i+1)*q{i}(x)-b(i)*q{i-1}(x);
        c(i+1) = sum(q{i+1}(X).*f(X))/sum((q{i+1}(X)).^2);
    end
    
    polynom = 0;
    for i=1:n
        polynom=polynom+c(i)*q{i}(t);
    end
end

