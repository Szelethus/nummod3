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