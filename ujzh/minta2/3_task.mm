# plotok

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
# Usage.
################################################################

PlotF := plot([2*cos(2*t)*cos(t), 2*cos(2*t)*sin(t), t=0..2*Pi], scaling=constrained, color=red):;
PlotG := plot([cos(6*t)*cos(t), cos(6*t)*sin(t), t=0..2*Pi], scaling=constrained, color=green):;

plots[display](PlotF, PlotG);