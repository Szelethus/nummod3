# Készítsen egy eljárást (hívása legyen QR_algoritmus(a,m)),
# amelyik végrehajtja az úgynevezett QR algoritmus m lépését az
# a mátrixon. Az algoritmus a
# következő: A(0) = A = Q1R1 A(1) = R1Q1 = Q2R2 A(2) = R2Q2...
# Azt lehet tudni, hogy ekkor a mátrixsorozat minden eleme hasonló
# A-hoz és a sorozat
# felső háromszögmátrixhoz konvergál. Az eljárás az A(m) mátrix
# diagonális elemeit
# tartalmazó listával térjen vissza! Számítsa ki az a:=amatrix(5)
# mátrixra m=10 iterációra a mátrix sajátértékeinek a közelítését
# a programmal, majd vesse össze a
# beépített sajátérték kiszámító függvény eredményével is. (6 pont)


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

QR_algoritmus := proc(a, m);
	A_prev := a;
	for J from 0 by 1 to m do;
		R = QRdecomp(A_prev, Q = 'Q');
		A_prev := R * Q;
	end do;

	A_prev := evalm(A_prev);
	return [seq(evalf(A_prev[J, J]), J=1..5)];
end;

################################################################
# Usage.
################################################################

a := matrix(5, 5, rand(0..100));
QR_algoritmus(a, 10);