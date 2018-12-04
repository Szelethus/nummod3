# Abrázolja az 'f(x) = sin(x)/x^2' és 'g(x) = sin(x^2)'
# függvényeket közös koordinátarendszerben. Az 'f'
# színe legyen piros, a 'g' színe legyen kék, a
# koordinátatengelyek pedig azonos beosztásúak legyenek!
# Generáljon egy-egy 'x, y' valós, 'n' komponensű
# véletlen számokból álló vektort, ahol 'x_i' az '[1; 10]',
# 'y_i' a '[−3; 3]' intervalluman van, majd az '(x_i, y_i)'
# koordinátájú pontokat zöld körökkel jelenítse meg a közös
# koordinátarendszerben!

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

################################
# Executed code.
################################