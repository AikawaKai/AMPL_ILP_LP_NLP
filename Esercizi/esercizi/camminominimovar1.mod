param n;
set nodi := 1..n;

set archi within {nodi, nodi};

param origin within nodi;
param destinazione within nodi;

param Costo{archi} >=0;

var x{archi} binary;

maximize NumCammini : sum {(origin, j) in archi} x[origin,j];

subject to vincoloBilancio{j in nodi: j!=origin and j!=destinazione}:
  sum{(i,j) in archi} x[i,j] = sum {(j,k) in archi} x[j,k];

subject to cammini_disgiunti {j in nodi : j!= destinazione and j!=origin}:
  sum {(i,j) in archi} x[i,j] <=1;

subject to no_riflusso:
  sum{(i,origin) in archi} x[i,origin] = 0;
