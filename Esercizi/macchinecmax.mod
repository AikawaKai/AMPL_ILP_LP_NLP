# processi e macchine 
param m >= 0;
param n >= 0;
set Macchine := 1..m;
set Processi := 1..n;
param p {Macchine, Processi} >= 0;
var x {Macchine, Processi} binary;
var Cmax >= 0;
minimize max_tempo: Cmax;
# minimize tempo : sum{i in Macchine, j in Processi} p[i,j] * x[i,j];
subject to assegnamento{j in Processi} : 
	sum{i in Macchine} x[i,j] = 1;
subject to min_max_time {i in Macchine}: 
	sum {j in Processi} p[i,j]*x[i,j] <= Cmax;