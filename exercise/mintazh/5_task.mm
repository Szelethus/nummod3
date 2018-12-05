# Írjon olyan eljárást melynek bemenete egy 'A', 'n*n' méretű
# valós mátrix, valamint egy 'v', n komponensű valós vektor!
# Készítse el az 'A' mátrix hatványainak QR-felbontását!
# Jelölje az 'A^k' mátrix QR felbontását 'Q_k * R_k'. Az
# eljárás kimenete legyen egy lista, melynek elemei rendre
#   ||R_1||_F * Q_1 * v, ..., ||R_n||_F * Q_n * v.

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
  if Exponent = 0 then
    return 1;
  elif Exponent = 1 then
    return Mtx;
  end if;
  
  return multiply(seq(Mtx, J=1..Exponent));
end;

get_element := proc(A, V, Index);
  # While no sane person would ever let this through during
  # any code review, this function has both a return value
  # and an out-parameter(ish). The second parameter
  # specifies the name of the variable in which the Q matrix
  # will be stored.
  R := QRdecomp(pow(A, J), Q = 'Q');

  return evalm(norm(R, 'frobenius') * Q &* V);
end;

fifth_task := proc(A, V);
  return [seq(get_element(A, V, J), J=1..coldim(A))];
end;

################################################################
# Executed code.
################################################################

Size := 3;

A := matrix(Size, Size, [1, 6, 8,
                         9, 5, 3,
                         5, 2, 2]);

V := vector([6, 3, 4]);

# This looks awesome, but we really should evalf() it.
fifth_task(A, V);