param n;
set nodi := 1..n;

set archi within {nodi, nodi};

param origin within nodi;
param destinazione within nodi;

param Costo{archi} >=0;

var x{archi} binary;

minimize costo_cammino: sum{(i,j) in archi} Costo[i,j]*x[i,j];

subject to vincoloBilancio{j in nodi: j!=origin and j!=destinazione}:
  sum{(i,j) in archi} x[i,j] = sum {(j,k) in archi} x[j,k];

subject to onlyOneStart:
  sum{(origin,j) in archi} x[origin,j] = 1;

subject to onlyOneEnd:
  sum{(i,destinazione) in archi} x[i,destinazione] = 1;

subject to no_riflusso:
  sum{(i,origin) in archi} x[i,origin] = 0;

subject to nothing_After_destination:
  sum{(destinazione,i) in archi} x[destinazione,i] = 0;
