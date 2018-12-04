# Abrázolja az 'f(x) = sin(x)/x^2' és 'g(x) = sin(x^2)'
# függvényeket közös koordinátarendszerben. Az 'f'
# színe legyen piros, a 'g' színe legyen kék, a
# koordinátatengelyek pedig azonos beosztásúak legyenek!
# Generáljon egy-egy 'x', 'y' valós, 'n' komponensű
# véletlen számokból álló vektorokat, ahol 'x_i' az
# '[1; 10]', 'y_i' a '[−3; 3]' intervalluman van, majd az
# '(x_i, y_i)' koordinátájú pontokat zöld körökkel
# jelenítse meg a közös koordinátarendszerben!

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

################################
# Function definitions.
################################

generate_vec_with_rand_elements := proc(Size, LowerBound,
                                        UpperBound);
  # In order for this to work properly, LowerBound and
  # UpperBound mustn't be of a floating point type.
  IntervalWidth := eval(UpperBound - LowerBound);

  GenerateElement := x ->
      # Generate a random integer in
      # [LowerBound, UpperBound].
      eval(rand() mod IntervalWidth) + LowerBound
           
      # Generate a random number in [0, 1].
      + evalf(rand() / 10^12);

  return vector(Size, GenerateElement);
end;
                                        
################################
# Executed code.
################################

N := 1000;
PlotSize := 10;

F := sin(X) / X^2;
PlotF := plot(F, X = 1..PlotSize, color = 'red'):;

G := sin(X^2);
PlotG := plot(G, X = 1..PlotSize, color = 'blue'):;

VecX := generate_vec_with_rand_elements(N, 1, 10);
VecY := generate_vec_with_rand_elements(N, -3, 3);

PlotDots := plot([seq([VecX[J], VecY[J]], J = 1..N)],
                 color = 'green',
                 style = 'point',
                 symbol = 'circle'):;

plots[display]({PlotF, PlotG, PlotDots},
               scaling = constrained);

