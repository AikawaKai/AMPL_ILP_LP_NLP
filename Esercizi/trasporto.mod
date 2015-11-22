# SETS
set MAGAZZINI;
set PORTI;

# PARAMS
param capienza { MAGAZZINI } >= 0;
param richiesta { PORTI } >= 0;
param distanza { MAGAZZINI, PORTI } >= 0;
param costokm >= 0;

# VARIABLES
var x { MAGAZZINI, PORTI } >= 0; #integer;

# OBJECTIVE FUNCTION
minimize costo:
   sum {i in MAGAZZINI, j in PORTI} costokm * distanza[i,j] * x[i,j];

# CONSTRAINTS
subject to disponibilita {i in MAGAZZINI}:
   sum {j in PORTI} x[i,j] <= capienza[i];

subject to domanda {j in PORTI}:
   sum {i in MAGAZZINI} x[i,j] >= richiesta[j];
