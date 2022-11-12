function L = Lagrange(x ,X, Y)
    summ = 0;  
    n = size(X);
    for i = 1:n
        multiply = 1;
        for j = 1:n
            if i ~= j
                multiply = multiply .* ((x-X(j))./(X(i)-X(j)));
            end
        end
        summ = summ + Y(i)*multiply;
    end
    L = summ;
end