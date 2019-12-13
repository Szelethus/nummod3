# Írjon egy olyan eljárást (hívása amatrix(n) legyen) amely egy
# olyan mátrixot állít elő, amelynek a főátlójában 2-esek, a két
# mellékátlójában -1-esek, egyébként pedig egyesek állnak. Példahívásként szerepeljen az amatrix(3), amatrix(5) és
# amatrix(10) eredménye!

################################################################
# Includes.
################################################################

with(linalg):;
with(plots):;

################################################################
# Global option setup.
################################################################

interface(warnlevel=0);
plotsetup(maplet);

################################################################
# Function definitions.
################################################################

gen_mellek := proc(n);
	zeros := vector(n - 1, 0);
	zeros2 := vector(n, 0);
	
	return augment(zeros2, transpose(augment(diag(seq(-2, J=1..n-1)), zeros)));
end;

gen_mellek2 := proc(n);
	zeros := vector(n - 1, 0);
	zeros2 := vector(n, 0);
	
	return augment(transpose(augment(zeros, diag(seq(-2, J=1..n-1)))), zeros2);
end;

gen_mtx := proc(n);
	return evalm(matrix(n, n, 1) + diag(seq(1, J=1..n)) + gen_mellek(n) + gen_mellek2(n));
end;

################################################################
# Usage.
################################################################

gen_mtx(4);
gen_mtx(5);
gen_mtx(6);