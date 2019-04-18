
cap log using "C:\Users\Stefan\Documents\MATLAB\220C\Faridani_220C_PS1.smcl"
cd "C:\Users\Stefan\Documents\MATLAB\220C"

clear
clear matrix
#delimit ;
set memory 50m;
set more off;
set matsize 300;
capture log close;


use "handguns",clear;

desc;
summarize;
gen log_vio=log(vio);
gen log_mur=log(mur);
gen log_rob=log(rob);

/************ Question 1 *******/
reg log_vio shall, r;
outreg2 using "ps1_q1.tex", replace keep(shall);
reg log_mur shall, r;
outreg2 using "ps1_q1.tex", append keep(shall);
reg log_rob shall, r;
outreg2 using "ps1_q1.tex", append keep(shall);


/************ Question IIa *******/
reg log_vio shall incarc_rate density pop pm1029 avginc, r;
outreg2 using "ps1_q2.tex", replace keep(shall);
reg log_mur shall incarc_rate density pop pm1029 avginc, r;
outreg2 using "ps1_q2.tex", append keep(shall);
reg log_rob shall incarc_rate density pop pm1029 avginc, r;
outreg2 using "ps1_q2.tex", append keep(shall);


/************ Question IIIa *******/
reg log_vio shall incarc_rate density pop pm1029 avginc, r;
outreg2 using "ps1_q3_vio.tex", replace keep(shall) ;
reg log_vio shall incarc_rate density pop pm1029 avginc i.stateid, r;
testparm i.stateid;
local F1= r(F);

outreg2 using "ps1_q3_vio.tex", append keep(shall) addstat(F-test FE, `F1');
reg log_mur shall incarc_rate density pop pm1029 avginc, r;
outreg2 using "ps1_q3_vio.tex", append keep(shall) ;
reg log_mur shall incarc_rate density pop pm1029 avginc i.stateid, r;
testparm i.stateid;
local F1= r(F);
outreg2 using "ps1_q3_vio.tex", append keep(shall) addstat(F-test FE, `F1');

reg log_rob shall incarc_rate density pop pm1029 avginc, r;
outreg2 using "ps1_q3_vio.tex", append keep(shall) ;
reg log_rob shall incarc_rate density pop pm1029 avginc i.stateid, r;
testparm i.stateid;
local F1= r(F);
outreg2 using "ps1_q3_vio.tex", append keep(shall) addstat(F-test FE, `F1');


cap log close;
