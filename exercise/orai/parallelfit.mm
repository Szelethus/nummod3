with(plots);
with(linalg);
interface(warnlevel = 0);

parallelfit := proc(x,y,u,v)
	N := vectdim(x);
    M := vectdim(u);
	ones1 := vector(N, 1);
	zeros1 := vector(N, 0);
	ones2 := vector(M, 1);
	zeros2 := vector(M, 0);
	A1 := augment(ones1, zeros1, x, y);
	A2 := augment(zeros2, ones2, u, v);
	A := transpose(augment(transpose(A1), transpose(A2)));
	R := evalf(QRdecomp(A));
	B := submatrix(R, 3 .. 4, 3 .. 4);
	R1 := submatrix(R, 1 .. 2, 1 .. 2);
	R2 := submatrix(R, 1 .. 2, 3 .. 4);

	evalf(Svd(B, V, 'right'));

	n := col(V,2);
	c := evalm(-(inverse(R1)&*R2&*n));

	p1 := plot([seq([x[i], y[i]], i = 1 .. N)], color = red, style = point, symbol = circle);

	p2 := plot([seq([u[i], v[i]], i = 1 .. M)], color = blue, style = point, symbol = box);
	p3 := plot(-n[1]*z/n[2]-c[1]/n[2], z = x[1] .. x[N], color = red);

	p4 := plot(-n[1]*z/n[2]-c[2]/n[2], z = u[1] .. u[M], color = blue); 

	display(p1, p2, p3, p4);
end proc;


x := vector(4, [1, 2, 3, 4]);
y := vector(4, [2, 3, 5, 5]);
u := vector(3, [1, 3, 5]);
v := vector(3, [4, 6, 7]);

parallelfit(x,y,u,v);


