set OGGETTI;
set CONTAINER;

param PESO{OGGETTI};
param VOLUME{OGGETTI};

param COSTO{CONTAINER};
param CAPACITA_P{CONTAINER};
param CAPACITA_V{CONTAINER};

var ATTIVAZIONE{CONTAINER} binary;

minimize costo_to: sum{i in CONTAINER} ATTIVAZIONE[i]*COSTO[i];

subject to max_peso:
  sum{i in CONTAINER} ATTIVAZIONE[i]*CAPACITA_P[i] >= sum {j in OGGETTI}PESO[j];

subject to max_volume:
  sum{i in CONTAINER} ATTIVAZIONE[i]*CAPACITA_V[i] >= sum{j in OGGETTI}VOLUME[j];
