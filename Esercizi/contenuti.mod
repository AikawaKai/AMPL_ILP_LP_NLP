set N;
param r {i in N};
var x {i in N} default i;
var y {i in N} default -i;
var R >= 0;

minimize raggio: R;

subject to no_inter {i in N, j in N: i>j}:
sqrt((x[i]-x[j])^2+(y[i]-y[j])^2) >= r[i]+r[j];
subject to _contenuti {i in N}:
sqrt(x[i]^2+y[i]^2) <= R+r[i];
