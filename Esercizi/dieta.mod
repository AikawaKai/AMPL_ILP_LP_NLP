#SETS
set I; #Insieme dei nutrienti
set J; #Insieme degli alimenti

#PARAMS
param costo{J};
param quantita_max{J};
param fabbisogno{I};
param apporto{I,J};

#VARS
# var x{J} >= 0;

# E' possibile indicare direttamente un limite superiore 
# per ogni variabile
var x{j in J} >= 0, <= quantita_max[j];

#OBJ
minimize costo_totale:
   sum{j in J} costo[j] * x[j];

#CONSTRAINTS
subject to FabbisognoGiornaliero {i in I}:
   sum{j in J} apporto[i,j] * x[j] >= fabbisogno[i];

#subject to QuantitaMassima {j in J}:
#   x[j] <= quantita_max[j];
