set Cioccolate;
set Ingredienti;

param IngredientiNecessari{Ingredienti, Cioccolate};

param maxIngredienti{Ingredienti};

param prezzi{Cioccolate};

var KgVenduti{Cioccolate} >=0 integer;

maximize profitto: sum{i in Cioccolate} KgVenduti[i]*prezzi[i];

subject to maxingredienti{i in Ingredienti}:
  sum{j in Cioccolate} KgVenduti[j]*IngredientiNecessari[i,j] <= maxIngredienti[i];
