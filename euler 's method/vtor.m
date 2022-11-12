function h = vtor(y)
n = 1;
for i = 1:2:length(y)
    h(n) = y(i);
    n = n+1;
end
end
