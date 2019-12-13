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

gen_mtx := proc(n);
	b := matrix(n, n, rand(1..10));
	return evalm(b &* transpose(b));
end;

bmatrix := proc(B);
	diagsum := sum(B[k, k]^2, k=1..5);
	belowsum := sum(B[k+1, k]^2, k=1..4);
	
	if diagsum > belowsum then;
		return matrix(5, 5, (i, j) -> if i > j then B[i, j] else 0 end if);
	elif diagsum < belowsum then;
		return matrix(5, 5, (i, j) -> if i < j then B[i, j] else 0 end if);
	else
		return diag(seq(B[J, J], J=1..5));
	end if;
end;

################################################################
# Usage.
################################################################

B := diag(1,1,1,1,1);
B[2, 1] := 5;
B[1, 2] := 1;
bmatrix(B);
B := diag(1,1,1,1,1);
B[2, 1] := 1;
B[1, 2] := 1;
bmatrix(B);
B := diag(1,1,1,1,1);
B[2, 1] := 2;
B[3, 2] := 1;
bmatrix(B);

