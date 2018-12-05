# Oldja meg numerikusan az alábbi
# differenciálegyenlet-rendszerhez tartozó kezdeti érték
# problémát, és ábrázolja a megoldást!
#
#  x'(t) = 2x(t) + sin(y(t)),   y'(t) = cos(x(t)) − 3y(t)
#                    x(0) = 1, y(0) = 2

# A 4. orai munkafüzetben van szó analitikus és numerikus
# differenciálegyenlet-rendszer megoldásról.

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

# BV actually means "boundary value".

FirstDE := diff(x(t), t) = 2*x(t) + sin(y(t));
SecondDE := diff(y(t), t) = cos(x(t)) - 3*y(t);

DEs := { FirstDE, SecondDE };
BVs := { x(0) = 0, y(0) = 2 };

# Note that if you don't add type = numeric, this beast will eat
# your RAM. And then go for seconds.
Result := dsolve(DEs union BVs, { x(t), y(t) }, type = numeric);

odeplot(Result, [[t, x(t)], [t, y(t)]], 0 .. 2*Pi);