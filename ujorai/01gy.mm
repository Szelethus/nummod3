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

#plot(f2, -1..1);
#plot({f, x->exp(-x)}, 0..10);
#plot(f, 0..1);

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

egyillregi := proc(x, y)
	N := vectdim(x);
	egyesek := vector(N, 1);
	A := augment(egyesek, x);
	z := linsolve(transpose(A) &* A, transpose(A) &* y);
	p1 := plot(z[2] * u + z[1], u = x[1]..x[N]);
	p2 := plot([seq([x[i], y[i], i=1..N],
end;