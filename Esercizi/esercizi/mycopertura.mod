set AREE;
set SITI;

param COSTI{SITI};
param COPERTURA{AREE,SITI};
param REQUISITI{AREE};

var ATTIVAZIONE{SITI} binary;

minimize costo: sum{i in SITI} COSTI[i]*ATTIVAZIONE[i];

subject to requisiti_rispettati{i in AREE}:
  sum{j in SITI} ATTIVAZIONE[j] * COPERTURA[i,j] >= REQUISITI[i]
