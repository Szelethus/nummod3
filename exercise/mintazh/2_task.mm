# Állítson elő tetszőleges 'n' mellett egy A 2 Rn×n méretű
# mátrixot, melynek minden off-diagonális eleme 1, a
# diagonális elemei pedig 0-k! Allítsa elő az 
# 'A^4 − 13A^2 − 12A' mátrixot!

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

pow := proc(Mtx, Exponent);
  return multiply(seq(Mtx, J = 1..Exponent));
end;

generate_matrix_diagonal_zeros_rest_ones := proc(Size);
  return matrix(Size, Size, 1) - diag(seq(1, J = 1..Size));
end;

################################################################
# Executed code.
################################################################

Size := 10;

A := generate_matrix_diagonal_zeros_rest_ones(Size):;

evalm(A);

evalm(
  pow(A, 4) - multiply(matrix(Size, Size, 13), pow(A, 2)) - A
);