# Írjon olyan eljárást melynek bemenete egy 'A', 'n*n' méretű
# valós mátrix, valamint egy 'v', n komponensű valós vektor!
# Készítse el az 'A' mátrix hatványainak QR-felbontását!
# Jelölje az 'A^k' mátrix QR felbontását Q_kR_k. Az eljárás
# kimenete legyen egy lista, melynek elemei rendre
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

################################################################
# Executed code.
################################################################