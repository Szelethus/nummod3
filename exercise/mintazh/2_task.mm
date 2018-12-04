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

generate_matrix_diagonal_zeros_rest_ones := proc(Size);
  A := matrix(Size, Size, 1);

  for J from 1 by 1 to Size do
    A[J, J] := 0;
  end do;
  
  return matrix(A);
end;

pow := proc(Mtx, Exponent);
  # Force copy by using matrix().
  Result := matrix(Mtx);

  for J from 1 by 1 to Exponent - 1 do
    Result := multiply(Result, Mtx);
  end do;
  
  return matrix(Result);
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

###############################
# Executed code.
###############################

Size := 3;

A := generate_matrix_diagonal_zeros_rest_ones(Size);

subtract(
  subtract(
    pow(A, 4),
    multiply(matrix(Size, Size, 13), pow(A, 2))
  ),
  A
);