function integral = int_gauss(t,A_i,N)
a = -1;
b = 1;
s = length(t);
integral = [];
interval = linspace(a,b,N);
    for i =1:length(interval) - 1
        a1 = interval(i);
        b1 = interval(i+1);
        INT = 0;
            for k=1:s
                INT=INT+A_i(k)*f((a1+b1)/2+t(k)*(b1-a1)/2);
            end
            INT = INT*(b1-a1)/2;
            integral = [integral INT];
    end
    integral = sum(integral);
end