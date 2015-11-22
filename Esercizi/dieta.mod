
set Alimenti;

param Costo{Alimenti};
param MaxQuantita{Alimenti};

param minCalorie := 600;
param minProteine := 50;
param minCalcio := 0.7;

param CalorieAlimenti{Alimenti};
param ProteineAlimenti{Alimenti};
param CalcioAlimenti{Alimenti};

var Hg{Alimenti}>=0 integer;

minimize COSTOTOT : sum{i in Alimenti} Hg[i] * Costo[i];

subject to proteine:
  sum{i in Alimenti} Hg[i]*ProteineAlimenti[i] >= minProteine;
subject to calorie:
  sum{i in Alimenti} Hg[i]*CalorieAlimenti[i] >= minCalorie;
subject to calcio:
  sum{i in Alimenti} Hg[i]*CalcioAlimenti[i] >= minCalcio;

subject to maxAlimenti {i in Alimenti}:
  Hg[i]<=MaxQuantita[i];
