*install package
ssc install epimodels

*cara mudah SIR dan SEIR
db epi_sir
db epi_seir

*cara manual SIR
 epi_sir, days(100) clear beta(0.5) gamma(0.33333) susceptible(60.4e+06) infected(100) scheme("s2mono") scale(0.75)
 
 *cara manual SEIR
 epi_seir, beta(0.9) gamma(0.2) sigma(0.5) mu(0.00) nu(0.00) susceptible(1000) exposed(1) infected(0) recovered(0) days(150) day0(1999-12-01) steps(1) scheme(s2mono)
 
 *cara menambahkan peak day
 
clear all
version 16.0

local params beta(0.50) gamma(0.33333) 
local init susceptible(60.4e+06) infected(1000) recovered(0.00)
local opts days(100) clear day0("2020-02-01") percent 
local model epi_sir, `params' `init' `opts' 

quietly `model' nograph
local maxi=r(maxinfect)
local maxt=r(t_maxinfect)

quietly summarize t, meanonly
local lastday=r(max)

local col "red"
local maxdate = string(`maxt', "%dCY-N-D")
local maxf=string(`maxi',"%6.2f")
local atext="peak value: `maxf'% on `maxdate'"
	
`model' ///
	lcolor(blue red green) lwidth(medthick medthick medthick) ///
	yline(`maxi', lcolor(`col') lpattern(-..-)) ///
	text(`maxi' `lastday' "`atext'" , color(`col') size(vsmall) ///
	placement(10) justification(right)  margin(0 0 1 0)) 

* simulasi parameter yang berbeda, dalam hal ini adalah nilai beta

clear all

local i=0
forval b=0.3(0.1)0.8 {
	epi_sir, days(100) nograph /// 
			  beta(`b') gamma(0.13) ///
			  susceptible(60.4e+04) infected(1) 
	local bstr=string(`b',"%6.2f")
	label variable I `"Infected ({&beta}=`bstr')"'
	local i=`i'+1	
	rename I I`i'
	local v=`"`v' I`i'"'
	drop S R
	if ("`bstr'"!="0.80") drop t
}

twoway line `v' t, ///
   ylabel(,format(%10.0gc)) graphregion(fcolor(white)) ///
   title("SIR model ({&gamma}=0.13)") ///
   note("Note: Higher values of {&beta} correspond to higher peak values for number of infected.", color(gray))

*simulasi juga bisa kita lakukan berdasarkan intervensi

clear all
version 16.0

local interventiondate=7
local modelwindow=60
local betaA=0.90
local betaB=0.30

local notetxt = "Note: social distancing policy reducing intensity of " ///
              + "spread of the disease from {&beta}=`betaA' to " ///
			  + "{&beta}=`betaB' after `interventiondate' days."

local inicond0 "susceptible(10000) " ///
             + "infected(50) " ///
	         + "recovered(0)"

epi_sir, beta(`betaA') gamma(0.1) `inicond0' ///
		 days(`modelwindow') clear day0(1999-12-31) nograph
		 
local mA `r(maxinfect)'
local d1=t[`interventiondate']
local inicond1 = "susceptible(`=S[`interventiondate']') " ///
               + "infected(`=I[`interventiondate']') " ///
	           + "recovered(`=R[`interventiondate']')"
			 
label variable I "Infected, no intervention ({&beta}=0.9)"
sort t
tempfile tmp
save `"`tmp'"'
clear

local day1=string(`d1',"%tdCY-N-D")

epi_sir, beta(`betaB') gamma(0.1) `inicond1' ///
		 days(`=`modelwindow'-`interventiondate'+1') ///
		 clear day0(`day1') nograph
		 
local mB `r(maxinfect)'

label variable I "Infected, with intervention ({&beta}=0.3)"

rename S SB
rename I IB
rename R RB

sort t
merge t using `"`tmp'"'
sort t
local z=t[`interventiondate']
local effect "`mB' `z' `mA' `z'"
twoway line I IB t, xlabel(`=t[1]'(15)`=t[`=_N']') ///
  lcolor(maroon navy) lwidth(medthick medthick) ///
  xline(`z', lpattern("-") lcolor(green)) ///
  || scatteri `effect', recast(line) color(green) lwidth(medthick) ///
  || scatteri `effect', msize(large) msymbol(plus) color(green) ///
  legend(order(1 2 3) label(3 "reduction in peak due to intervention") ///
  position(bottom) rows(2) region(fcolor(none))) ///
  title("Effect of intervention (social distancing) in SIR model") ///
  note("`notetxt'", color(gray) size(vsmall))

   
* kita juga bisa membuat profil epidemic

clear
epi_sir, beta(0.85) gamma(0.15) ///
         susceptible(10000) infected(100) recovered(0.00) ///
		 days(50) nograph clear 
		 
local p `"`r(model_params)'"'
local d=r(d_maxinfect)
local d1=`d'+1

generate double s1=S
label variable s1 "`:variable label S'"
generate double s2=S+I
label variable s2 "`:variable label I'"
generate double s3=S+I+R
label variable s3 "`:variable label R'"

twoway area s3 s2 s1 t , title("SIR model (`p')") ///
    || scatteri `=s1[`d1']' `d' `=s2[`d1']' `d', ///
	recast(line) lcolor(red) lwidth(medthick) ///
	|| scatteri `=s1[`d1']' `d' `=s2[`d1']' `d', mcolor(red) ///
	legend( ///
	  order(3 2 1 4) pos(bottom) rows(1) ///
	  region(fcolor(none)) label(4 "Peak infected") ///
	) scale(0.75) ylabel(, format(%9.0gc))

* kita bisa juga melihat sensitivitas sebuah indikator untuk menyadari bahwa nilai beta yang tinggi tidak selalu menunjukkan puncak kasus yang lebih awal

clear all

frame create results
frame results: generate b=.
frame results: generate d=.
frame results: generate mi=.

local gamma=0.25
local s=1000
local i=10
local days=60

forval b=0.01(0.01)0.99 {
    epi_sir, beta(`b') gamma(`gamma') ///
	         susceptible(`s') infected(`i') ///
	         days(`days') nograph clear
	local d=`r(d_maxinfect)'
	local mi=`r(maxinfect)'
	quietly {
		frame change results
			set obs `=_N+1'
			replace b=`b' in L
			replace d=`d' in L
			replace mi=`mi' in L
		frame change default
	}
}

frame change results
twoway line d b || scatter d b, msize(vsmall) scale(0.75) name(d) ///
   xtitle("{&beta}") ytitle("Day of peak infected") legend(off)
   
twoway line mi b || scatter mi b, msize(vsmall) scale(0.75) name(mi) ///
    xtitle("{&beta}") ytitle("Maximum number of infected") legend(off)
	
graph combine d mi, cols(1) xsize(6) ysize(6) ///
  title("SIR model predictions for {&gamma}=`gamma' and varying {&beta}.", ///
    size(medium)) ///
  note("Note: starting with a population of `s' susceptible and `i' infected at t0," ///
    "modeling over `days' days", color(gray))
  