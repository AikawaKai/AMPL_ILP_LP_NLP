#cammino minimo
set Nodi;

set Archi within {Nodi, Nodi};

param Origine within Nodi;
param Destinazione within Nodi;
param Costo {Archi} >= 0;

var x {Archi} binary;

#minimize CostoTotale : = sum{(i,j) in Archi} Costo[i,j] * x[i,j];
maximize NumCammini : sum {(Origine,j) in Archi} x[Origine,j];

subject to VincoloBilancio {j in Nodi: j != Origine and j!= Destinazione}:
	sum{(i,j) in Archi} x[i,j] = sum{(j,k) in Archi} x[j,k];
	
subject to VincoloOrigine :
	sum{(Origine,j) in Archi} x[Origine,j] = 1;
subject to VincoloDestinazione:
	sum{(i, Destinazione) in Archi} x[i,Destinazione] = 1;
subject to camminidisgiunti {j in Nodi : j != Origine and j != Destinazione}:
	sum {(i,j) in Archi} x[i,j] <= 1;
#subject to noriflusso: sum{(i,}
	