set ORIG;   # origins
set DEST;   # destinations

param supply {ORIG} >= 0;   # amounts available at origins
param demand {DEST} >= 0;   # amounts required at destinations
param open_cost {ORIG} >= 0;   # opening cost

   check: sum {i in ORIG} supply[i] >= sum {j in DEST} demand[j];

param cost {ORIG,DEST} >= 0;   # shipment costs per unit
var Trans {ORIG,DEST} >= 0;    # units to be shipped
var Loc{ORIG} binary;

minimize Total_Cost:
   sum {i in ORIG, j in DEST} cost[i,j] * Trans[i,j] + sum {i in ORIG}Loc[i]*open_cost[i];

subject to Supply {i in ORIG}:
   sum {j in DEST} Trans[i,j] <= supply[i]*Loc[i];

subject to Demand {j in DEST}:
   sum {i in ORIG} Trans[i,j] >= demand[j];

subject to forcing {i in ORIG, j in DEST}:
   Trans[i,j] <= demand[j]*Loc[i];
