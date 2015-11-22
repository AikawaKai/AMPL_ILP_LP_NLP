param n;
set nodi := 1..n;
set archi within {nodi, nodi};

param origin within nodi;
param dest within nodi;

param costi{archi} >=0;
var x{archi} binary;

maximize numcammini: sum{(origin,j) in archi} x[origin,j];

subject to bilanciamento{j in nodi: j!= origin and j!= dest}:
  sum{(i,j) in archi} x[i,j] = sum{(j,k) in archi} x[j,k];

subject to noriflusso:
  sum{(i,origin) in archi} x[i,origin] = 0;

subject to nocamminisovrapposti{j in nodi: j!= dest}:
  sum{(i,j) in archi} x[i,j]<=1;
