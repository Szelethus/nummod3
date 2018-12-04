# Írjon két olyan eljárást, melyek paraméterei 'n' és 'k',
# egészek, kimenetük pedig az 'n' első természetes szám
# 'k'-adik hatványainak összege. Az első eljárásban
# használjon a feladat megoldásához ciklust, a második
# eljárásban viszont csak egyetlen Maple parancsot
# használjon!


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

sum_up_to_n_on_kth_exponent_for := proc(N, K);
  Sum := 0;

  for J from 1 by 1 to N do
    Sum := Sum + J^K;
  end do;

  return Sum;
end;

sum_up_to_n_on_kth_exponent_single_command := proc(N, K);
  return sum(J^K, J=1..N);
end;

###############################
# Executed code.
###############################

sum_up_to_n_on_kth_exponent_for(10, 2);
sum_up_to_n_on_kth_exponent_single_command(10, 2);