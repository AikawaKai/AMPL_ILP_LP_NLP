set PERSONE;
set LAVORI;

param COSTI{LAVORI, PERSONE};
var ATTIVAZIONE{LAVORI, PERSONE} binary;

minimize COSTO:
  sum{i in LAVORI, j in PERSONE} COSTI[i,j]*ATTIVAZIONE[i,j];

subject to onlyOne{i in LAVORI}:
  sum{j in PERSONE} ATTIVAZIONE[i,j] = 1;

subject to lavori{i in PERSONE}:
  sum{j in LAVORI} ATTIVAZIONE[j,i] = 1;
