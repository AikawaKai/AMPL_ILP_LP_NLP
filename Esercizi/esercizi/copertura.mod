set AREE;
set SITI;

param REQUISITI{AREE};
param COSTI{SITI};
param COPERTURA{AREE, SITI};

var ATTIVAZIONE{SITI} binary;

minimize COSTO: sum{i in SITI} ATTIVAZIONE[i]*COSTI[i];

subject to cover_all_area{i in AREE}:
  sum{j in SITI} COPERTURA[i,j]*ATTIVAZIONE[j] >= REQUISITI[i];
