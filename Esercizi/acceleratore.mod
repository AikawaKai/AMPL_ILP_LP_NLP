
# ----------------------------------------
# Acceleratore
# ----------------------------------------

param NumAnelli > 0 integer default 2;	# numero anelli
param NumCities > 0 integer;           # numero citta'
set Anelli := 1..NumAnelli;
set city := {1..NumCities};
set Pairs := {i in city, j in Anelli};	# coppie citta' anello
param CX{i in city};
param CY{i in city};
param CR{i in city};
param box{1..4};

var AX {i in Anelli} >= box[1], <= box[2];
var AY {i in Anelli} >= box[3], <= box[4];
var dist {(i,j) in Pairs} =		# distanza che separa la citta' i e l'anello j
      sqrt( (CX[i] - AX[j])^2 + (CY[i] - AY[j])^2 );
var distAnelli {i in Anelli, j in Anelli: i<j} =            # distanza che separa gli anelli 
      sqrt( (AX[i] - AX[j])^2 + (AY[i] - AY[j])^2 );
var AR{i in Anelli} >=0.1;

maximize Raggio_anelli: AR[1];

subj to non_tocco_city {(i,j) in Pairs}:
   dist[i,j]   >= CR[i] + AR[j];

subj to anelli_tangenti {i in Anelli, j in Anelli: i<j}:
   distAnelli[i,j] = AR[i] + AR[j];
subj to anelli_uguali {i in Anelli, j in Anelli: i<j}:
   AR[i] = AR[j];
subj to margine_sx {i in Anelli}:
   AX[i] - AR[i] >= box[1];
subj to margine_dx {i in Anelli}:
   AX[i] + AR[i] <= box[2];
subj to margine_basso {i in Anelli}:
   AY[i] - AR[i] >= box[3];
subj to margine_alto {i in Anelli}:
   AY[i] + AR[i] <= box[4];
   