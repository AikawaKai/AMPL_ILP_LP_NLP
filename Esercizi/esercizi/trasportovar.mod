# SETS
set MAGAZZINI;
set PORTI;

# PARAMS
param capienza { MAGAZZINI } >= 0;
param costo { MAGAZZINI } >= 0;
param richiesta { PORTI } >= 0;
param distanza { MAGAZZINI, PORTI } >= 0;
param costokm >= 0;

check :
  sum {i in MAGAZZINI} capienza[i] >= sum {j in PORTI} richiesta[j];

# VARIABLES
var x { MAGAZZINI, PORTI } >= 0; #integer;
var y {MAGAZZINI} binary;

# OBJECTIVE FUNCTION
minimize costo_totale:
   sum {i in MAGAZZINI, j in PORTI} costokm * distanza[i,j] * x[i,j] + sum {i in MAGAZZINI} costo[i]*y[i];

# CONSTRAINTS
subject to disponibilita {i in MAGAZZINI}:
   sum {j in PORTI} x[i,j] <= capienza[i]*y[i];

subject to domanda {j in PORTI}:
   sum {i in MAGAZZINI} x[i,j] >= richiesta[j];

subject to forzatura {i in MAGAZZINI, j in PORTI}:
  x[i,j] <= richiesta[j]*y[i];
