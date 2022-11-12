function [Y_sort] = delete_second(Y)
n=1;
for i=1:2:length(Y)
    Y_sort(n)=Y(i);
    n=n+1;
end
end