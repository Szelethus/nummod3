with(linalg); with(plots);

X := t->5*cos(t);
Y := t->5*sin(t);
a := 10;
x0 := 15; y0 := 0;

w1 := (X(t)-x(t))/a;

w2 := (Y(t) - y(t))/a;

seg := (diff(X(t), t) * w1 + diff(Y(t), t) * w2) / a;

#sys := {diff(x(t), t = seg(X(t) - x(t)), diff(y(t), t) = seg(Y(t) - y(t)), x(0) = x0, y(0) = y0};
sys := {diff(x(t), t) = seg*(X(t)-x(t)), diff(y(t), t) = seg*(Y(t)-y(t)), x(0) = x0, y(0) = y0};
mo := dsolve(sys, {x(t), y(t)}, type = numeric);

p1 := odeplot(mo, [x(t), y(t)], 0 .. 100, numpoints = 500, color = red):;

p2 := plot([X(t), Y(t), t = 0 .. 100], color = blue):;

display(p1, p2);