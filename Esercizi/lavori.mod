set Persone;
set Lavori;
param Tempi{Lavori, Persone};
var x{Lavori, Persone} binary;
minimize costo : sum{i in Lavori, j in Persone} Tempi[i,j]*x[i,j];
subject to unoperjob{i in Lavori}:
	sum{j in Persone} x[i,j] = 1;
subject to unoperpersona{j in Persone}:
	sum{i in Lavori} x[i,j] = 1;