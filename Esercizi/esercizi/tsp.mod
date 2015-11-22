param n>0, integer;
set V := 1..n;

param d{V,V} >=0;
param numerocicli >= 0, integer, default 0;
set ciclo{1..numerocicli};
var x{V,V} binary;
minimize costociclo: sum{i in V, j in V: i != j} d[i,j]*x[i,j];
subject to successore{i in V}:sum{j in V: i!=j} x[i,j] = 1;
subject to predecessore{j in V}:sum{i in V: i!=j} x[i,j] = 1;
subject to nocicli {k in 1..numerocicli}:
  sum{i in ciclo[k], j in V diff ciclo[k]} x[i,j] = 1;
