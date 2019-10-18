with(plots):;
plotsetup(maplet);

with(linalg):;

#plot([t, t, t = 0..1]);

#plot([2*t, 2*t, t = 0..1]);

#plot([cos(t), sin(t), t = 0..2*Pi]);

#plot([t*cos(t), t*sin(t), t = 0..10*Pi]);

#asztroid
#plot([cos(t)^3, sin(t)^3, t = 0..2*Pi]);

#vese
#plot([5*(1 + cos(t)) * cos(t), 5*(1 + cos(t)) * sin(t), t = 0..2*Pi]);

#differenciál e.:

de := diff(y(t), t) = y(t);
ke := y(0) = 1;

dsolve({de, ke}, y(t));

#Ha nincs kezdőfeltétel
dsolve(de, y(t));

######
de2 := diff(y(t), t) = y(t)^2;
ke := y(0) = 1;

dsolve({de, ke}, y(t));

######
mo := dsolve({de2, ke}, y(t), type=numeric);

#ehhez be kell tölteni a plot csomagot
#odeplot(mo, [t, y(t)], 0..5);

dey := diff(y(t), t) = 2*y(t) - z(t);
dez := diff(z(t), t) =  -y(t) + z(t);

mo := dsolve([dey, dez]);

#odeplot(mo, [[t, y(t)], [t, z(t)]], a..b);

######
#odeplot(mo, [t, y(t)], 0..5);

#dey := diff(y(t), t) =  -z(t);
#dez := diff(z(t), t) =  2*y(t);

#mo := dsolve(dey, dez);

#odeplot(mo, [[t, y(t)], [t, z(t)]], a..b);

a := 2;

dey := diff(y(t), t) = -y(t) / (sqrt(a^2-(y(t))^2));
key := y(0) = a - 0.0001;

mo := dsolve({dey, key}, y(t), type=numeric);
#odeplot(mo, [t, y(t)], 0..5);

#futó és a kutykuty

X := t->cos(t);
Y := t->sin(t);

w := 0.5;
x0 := 6; y0 := 7;

norma := sqrt((X(t) - x(t))^2 + (Y(t) - y(t))^2);

de := {diff(x(t), t) = (w/norma)*(X(t) - x(t)), diff(y(t), t) = (w/norma)*(Y(t) - y(t)), x(0) = x0, y(0) = y0};

mo := dsolve(de, {x(t), y(t)}, type=numeric);

odeplot(mo, [[x(t), y(t)], [X(t), Y(t)]], 0..40);
