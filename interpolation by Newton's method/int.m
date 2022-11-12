 function integral = int(n)
    a = -1
    b = 1
    h = (b-a)/(3*n)
    I = f(a)+f(b);
    for i = 1:3*n-1
        x = a+h*i;
        if mod(i,3) == 0
            I = I + 2*f(x);
        else
            I = I + 3*f(x);
        end
    end
    integral = 3/8*I*h;
end
