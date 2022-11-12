%нахождение Аi
function A_i = int_lagrange(t)
n = length(t);
A_i = [];
syms h;
L1 =0;
    for k=1:n
        p=1;
            for i=1:n
                if k~=i
                p=p*((h-t(i))/(t(k)-t(i)));
                end
            end
        integral = int(p,h,-1,1);
        A_i = [A_i integral];
        A_i = double(A_i);
    end
end