set OGGETTI;
set CONTAINER;

param PESO{OGGETTI};
param VOLUME{OGGETTI};

param COSTO{CONTAINER};
param CAPACITA_P{CONTAINER};
param CAPACITA_V{CONTAINER};

var ATTIVAZIONE{CONTAINER} binary;
var X{OGGETTI,CONTAINER} binary;

minimize costo: sum{i in CONTAINER} ATTIVAZIONE[i] * COSTO[i];

subject to max1xcontainer{i in OGGETTI}:
  sum{j in CONTAINER} X[i,j] = 1;

subject to maxpeso{j in CONTAINER}:
  sum{i in OGGETTI} X[i,j]*PESO[i] <= CAPACITA_P[j] * ATTIVAZIONE[j];

subject to maxvolume{j in CONTAINER}:
  sum{i in OGGETTI} X[i,j]*VOLUME[i] <= CAPACITA_V[j] * ATTIVAZIONE[j];
