# Állítson elő tetszőleges 'n' mellett egy A 2 Rn×n méretű
# mátrixot, melynek minden off-diagonális eleme 1, a
# diagonális elemei pedig 0-k! Allítsa elő az 
# 'A^4 − 13A^2 − 12A' mátrixot!

###############################
# Includes.
###############################

with(linalg):;
with(plots):;

###############################
# Global option setup.
###############################

interface(warnlevel=0);
plotsetup(maplet);

###############################
# Function definitions.
###############################

pow := proc(Mtx, Exponent);
  # Force copy by using matrix().
  return multiply(seq(Mtx, J = 1..Exponent));
end;

# How the fuck is it possible that we need to
# define this function? Is this surely the only
# way?
subtract := proc(Lhs, Rhs);
  # Force copy by using matrix().
  Result := matrix(Lhs);
  
  for RowI from 1 by 1 to rowdim(Lhs) do
    for ColI from 1 by 1 to coldim(Lhs) do
      Result[RowI, ColI] :=
          Result[RowI, ColI] - Rhs[RowI, ColI];
    end do;
  end do;
  
  return matrix(Result);
end;

generate_matrix_diagonal_zeros_rest_ones := proc(Size);
  return subtract(matrix(Size, Size, 1),
                  diag(seq(1, J = 1..Size)));
end;

###############################
# Executed code.
###############################

Size := 10;

A := generate_matrix_diagonal_zeros_rest_ones(Size);

subtract(
  subtract(
    pow(A, 4),
    multiply(matrix(Size, Size, 13), pow(A, 2))
  ),
  A
);