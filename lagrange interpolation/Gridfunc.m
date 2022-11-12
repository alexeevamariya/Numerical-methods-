%произвольная сетка со сгущением
function Grid = Gridfunc(a,b,n)
 Grid = linspace(a,b,n)
 v = linspace( Grid(round(n/2)-1),Grid(round(n/2)),n)
 Grid = [Grid v]
 Grid = unique(sort(Grid))
end