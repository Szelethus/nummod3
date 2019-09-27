#with(plots):;
#plotsetup(maplet);

x :=2;
y := sqrt(2);
z := Pi;
er := x + y + z;

evalf(er);

Digits;
Digits := 20;
evalf(er);

Digits := 10;

f := x -> sin(x^2);
f2 := x -> 1 / x;

plot(f2, -1..1);
plot({f, x->exp(-x)}, 0..10);
plot(f, 0..1);

sum(i^3, i=1..10);
sm1 := sum(i, i=1..n);
factor(simplify(sm1));
factor(simplify(sum(i^3, i=1..n)));
factor(simplify(sum(i^5, i=1..n)));

sum(1/i, i=1..infinity);
sum(1/i^2, i=1..infinity);
product(1/i, i=1..10);

with(linalg);

a := matrix(2, 2, [1,2,3,4]);
det(a);
A := inverse(a);
f := (i,j) -> j + i;

b := matrix(5, 5, f);
det(b);
c := vector(5, 1);

xv := linsolve(b, c);
x := 'x';
y := 'y';
with(plots);

egyillregi := proc (x, y)
	N := vectdim(x);
	egyesek := vector(N, 1);
	A := augment(egyesek, x);
	z := linsolve(transpose(A) &* A, transpose(A) &* y);
	p1 := plot(z[2]*u+z[1], u = x[1] .. x[N]);
	p2 := plot([seq([x[i], y[i]], i = 1 .. N)], style = point, symbol = circle);
	display(p1, p2)
end proc;

x := vector(4, [1, 2, 3, 4]);
y := vector(4, [2, 3, 2, 1]);
egyillregi(x, y);

egyillval := proc (x, y)
	N := vectdim(x);
	egyesek := vector(N, 1);
	A := augment(egyesek, x, y);
	R := evalf(QRdecomp(A));
	B := matrix(2, 2, [R[2, 2], R[2, 3], R[3, 2], R[3, 3]]);
	evalf(Svd(B, V, 'right'));
	n := col(V, 2);
	c := -(R[1, 2]*n[1]+R[1, 3]*n[2])/R[1, 1];
	p1 := plot([seq([x[i], y[i]], i = 1 .. N)], style = point, symbol = circle);
	p2 := plot(-n[1]*z/n[2]-c/n[2], z = x[1] .. x[N], color = blue);
	p3 := plot([[(sum(x[i], i = 1 .. N))/N, (sum(y[i], i = 1 .. N))/N]], style = point, symbol = diamond, color = blue);
	p1, p2, p3;
end proc;
display(egyillregi(x, y), egyillval(x, y));