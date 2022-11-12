%Чебышевская сетка
function ChebGrid= Chebfunc(a,b,n)
  ChebGrid = [];
  for i = 1:n
    x = 1/2*(a+b) + 1/2*(b-a)*cos((2*i+1)*pi/(2*n+2));
    ChebGrid = [ChebGrid x];  
  end
end

