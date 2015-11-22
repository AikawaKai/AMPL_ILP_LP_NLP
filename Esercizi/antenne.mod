set Aree;
set Siti;
param requisiti{Aree};
param Costi{Siti};
param Copertura{Aree,Siti};
var Attivazione{Siti} binary;
minimize costo: sum{j in Siti} Costi[j]*Attivazione[j];
subject to vincolocopertura{i in Aree}:
sum{j in Siti} Copertura[i,j]*Attivazione[j]>=requisiti[i];