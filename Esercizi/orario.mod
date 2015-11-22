set studenti;   
set slot; 
set lun;
set mar;
set mer;
set gio;
set ven;

param mat {studenti, slot} >= 0;   
var x {studenti} binary;    
var y {slot} binary;   


maximize numero_studenti:
   sum {j in studenti} x[j];

subject to giorni :
   sum {i in slot} y[i] = 2; 
subject to lunedi :
   sum {i in lun} y[i] <= 1;
subject to martedi :
   sum {i in mar} y[i] <= 1;
subject to mercoledi :
   sum {i in mer} y[i] <= 1;
subject to giovedi :
   sum {i in gio} y[i] <= 1;
subject to venerdi :
   sum {i in ven} y[i] <= 1;
   
subject to intersezione {j in studenti} :
   2*x[j] <= sum {i in slot} y[i]*mat[j,i];

subject to othersol:
    y[3] + y[8] <= 1;
subject to othersol1:
    y[8] + y[11] <= 1;
   