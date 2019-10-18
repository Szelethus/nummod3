with(linalg); with(plots);
plotsetup(maplet);

a := 1;
b := 2 * 10^(-3);
c := 10^(-5);
d := 8*10^(-2);
y0 := 20000;
z0 := 500;


diffy := diff(y(t), t) = a * y(t) - b * y(t) * z(t);
diffz := diff(z(t), t) = c * y(t) * z(t) - d * z(t);

key := y(0) = y0;
kez := z(0) = z0;

sys := {diffy, diffz, key, kez};
mo := dsolve(sys, {y(t), z(t)}, type = numeric);

p1 := odeplot(mo, [t, y(t)], t = 0..100, color = red):;

p2 := odeplot(mo, [t, z(t)], t = 0..100, color = blue):;

display(p1, p2);