set TipiCioccolata;

set Ingredienti;

param prezzo{TipiCioccolata} >= 0;

param q_max{Ingredienti} >= 0;

param rich{Ingredienti,TipiCioccolata} >= 0;

var x{TipiCioccolata} >= 0;

maximize profitto: sum{j in TipiCioccolata} prezzo[j] * x[j];

subject to v_ingr {i in Ingredienti}:
  sum{j in TipiCioccolata} rich[i,j]*x[j] <= q_max[i];

end;
