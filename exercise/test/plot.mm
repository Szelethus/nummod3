# A kettőspont nem szükséges, de ha ott van, nem ad az előtte
# levő parancs semmilyen outputot, pl. itt lényegtelen hogy
# milyen függvényeket importálunk be.
with(plots):;

plotsetup(maplet);

f:=x->x^2;

A := Array(1..2):;

A[1] := plot(f,0..1):;
A[2] := plot(f,0..2):;

display(A);