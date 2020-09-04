clear all
cd "C:\Users\nprue\Desktop\econ656"
import excel "C:\Users\nprue\Desktop\econ656\panel.xlsx", sheet("Sheet1") firstrow
reshape long agedep olddep youngdep curgdp cab xgdp ifdigdp gdp ggdp capgd invgdp savgdp inf manugdp mktcap life young old socin socnet findep bankacc emppop erlcuus rir, i(country) j(year)

sort country year
merge 1:1 country year using kaopen
drop if _merge == 2
drop ccode cn 

drop _merge
merge 1:1 country year using population
drop if _merge == 2

xtset id year

g primesave = (m4549y + m5054y + m5559y + m6064y)*(mpct/100) + (f4549y + f5054y + f5559y + f6064y)*(mpct/100)

bysort id: egen countca = count(curgdp) 

replace savgdp = 16.82 in 359
replace savgdp = 16.06 in 362

g sigdp = savgdp - invgdp
g gprime = ((primesave - l.primesave)/l.primesave) * 100
g gold = ((old - l.old)/l.old) * 100
g golddep = ((olddep - l.olddep)/l.olddep) * 100
g gprimelife = gprime*life
g gprimesoc = gprime*socin
g gprimekopen = gprime*kaopen
g gprimefin	= gprime*findep

g primelife = primesave*life
g primesoc = primesave*socin
g primekopen = primesave*kaopen
g primefin	= primesave*findep

g oldlife = old*life


sort id

foreach var in life socin kaopen findep {
	egen med = median(`var'), by(id)
	xtile group`var' = med, nq(3)
	drop med
} 

foreach var in grouplife groupsocin groupkaopen groupfindep  {
   bysort id: egen m`var' = mode(`var'), minmode missing
}
	
replace mgroupsoc = 3 in 99/147
replace mgroupsoc = 2 in 148/196
replace mgroupsoc = 2 in 197/245
replace mgroupsoc = 2 in 344/392
replace mgroupsoc = 3 in 393/490
replace mgroupfindep = 3 in 442/490
replace mgroupsoc = 2 in 540/637
replace mgroupsoc = 2 in 687/735
replace mgroupsoc = 3 in 785/833
replace mgroupfindep = 3 in 785/833
replace mgroupsoc = 2 in 1079/1127
replace mgroupsoc = 2 in 1177/1225
replace mgroupkaopen = 1 in 1177/1225
replace mgroupsoc = 1 in 1324/1372
replace mgroupkaopen = 2 in 1373/1421
replace mgroupsoc = 3 in 1520/1568
replace mgroupsoc = 1 in 1569/1617
replace mgroupkaopen = 2 in 2010/2059
replace mgroupsoc = 2 in 2157/2205
replace mgroupfindep = 2 in 2157/2205
replace mgroupsoc = 3 in 2206/2303
replace mgroupsoc = 1 in 2549/2646
replace mgroupsoc = 3 in 2647/2695
replace mgroupfindep = 3 in 2647/2695
replace mgroupsoc = 1 in 2696/2793
replace mgroupkaopen = 1 in 2696/2744
replace mgroupfindep = 3 in 2843/2940
replace mgroupsoc = 3 in 2843/2940
replace mgroupsoc = 2 in 3039/3087
replace mgroupsoc = 3 in 3088/3136
replace mgroupfindep = 3 in 3088/3136
replace mgroupsoc = 3 in 3186/3234
replace mgroupfindep = 3 in 3186/3234
replace mgroupsoc = 2 in 3235/3283
replace mgroupsoc = 1 in 3382/3430
replace mgroupsoc = 2 in 3431/3479
replace mgroupsoc = 3 in 3578/3626
replace mgroupkaopen = 3 in 3578/3626
replace mgroupsoc = 3 in 3676/3724
replace mgroupsoc = 2 in 3823/3871
replace mgroupsoc = 3 in 3921/4067
replace mgroupfindep = 3 in 3921/4067
replace mgroupsoc = 3 in 4117/4165
replace mgroupsoc = 2 in 4313/4459
replace mgroupfindep = 2 in 4313/4361
replace mgroupfindep = 3 in 4558/4606
replace mgroupsoc = 1 in 4656/4704
replace mgroupsoc = 2 in 4754/4802
replace mgroupfindep = 3 in 4803/4949
replace mgroupsocin = 3 in 4852/4949
replace mgroupkaopen = 3 in 4852/4949
replace mgroupsocin = 1 in 4950/4998
replace mgroupsocin = 3 in 5195/5243
replace mgroupfindep = 2 in 5195/5243
replace mgroupkaopen = 2 in 5538/5586
replace mgroupsocin = 2 in 5587/5635
replace mgroupsocin = 1 in 5685/5733
replace mgroupsocin = 3 in 5832/5929
replace mgroupfindep = 3 in 5832/5929
replace mgroupkaopen = 2 in 6077/6125
replace mgroupsocin = 2 in 6077/6125
replace mgroupsocin = 3 in 6126/6174
replace mgroupsocin = 2 in 6175/6223
replace mgroupsocin = 3 in 6567/6615
replace mgroupfindep = 3 in 6567/6615
replace mgroupsocin = 2 in 6616/6664
replace mgroupsocin = 2 in 6861/6958
replace mgroupkaopen = 2 in 6861/6909
replace mgroupsocin = 2 in 7008/7056
replace mgroupsocin = 1 in 7057/7105
replace mgroupsocin = 3 in 7106/7154
replace mgroupfindep = 2 in 7155/7252
replace mgroupsocin = 3 in 7204/7252
replace mgroupsocin = 1 in 7351/7399
replace mgroupkaopen = 1 in 7351/7399
replace mgroupsocin = 3 in 7400/7448
replace mgroupfindep = 3 in 7400/7448
replace mgroupsocin = 2 in 7498/7595
replace mgroupsocin = 1 in 7596/7644
replace mgroupsocin = 2 in 7645/7693
replace mgroupsocin = 3 in 7694/7791
replace mgroupkaopen = 2 in 7988/8036
replace mgroupsocin = 2 in 8135/8232
replace mgroupsocin = 2 in 8282/8330
replace mgroupfindep = 2 in 8282/8330
replace mgroupsocin = 2 in 8429/8477
replace mgroupsocin = 3 in 8478/8575
replace mgroupsocin = 2 in 8625/8722
replace mgroupfindep = 2 in 8625/8673
replace mgrouplife = 2 in 8772/8820

drop if id == 44

foreach var in mgrouplife mgroupsocin mgroupkaopen mgroupfindep {
	gen p`var' = 0
	replace p`var' = 1 if `var' == 3
	gen n`var' = 0
	replace n`var' = 1 if `var' == 1
	gen p`var'prime = p`var'*gprime
	gen n`var'prime = n`var'*gprime
	gen p`var'old = p`var'*old
	gen n`var'old = n`var'*old
	
} 

g lncap = ln(capgd)
bysort id: egen counti_sigdp = count(sigdp)

sort id year
g geer = 100*(erlcuus/l.erlcuus - 1)
 
$$ Static $$
eststo: quietly xtreg curgdp primesave ggdp ifdigdp manugdp, re 
eststo: quietly xtreg curgdp primesave pmgrouplifeprime nmgrouplifeprime pmgrouplife nmgrouplife ggdp ifdigdp manugdp, re 
eststo: quietly xtreg curgdp primesave pmgroupsocinprime nmgroupsocinprime pmgroupsocin nmgroupsocin ggdp ifdigdp manugdp, re 
eststo: quietly xtreg curgdp primesave pmgroupkaopenprime nmgroupkaopenprime pmgroupkaopen nmgroupkaopen ggdp ifdigdp manugdp, re 
eststo: quietly xtreg curgdp primesave pmgroupfindepprime nmgroupfindepprime pmgroupfindep nmgroupfindep ggdp ifdigdp manugdp, re 
eststo: quietly xtreg curgdp primesave pmgrouplifeprime nmgrouplifeprime pmgrouplife nmgrouplife pmgroupsocinprime nmgroupsocinprime pmgroupsocin nmgroupsocin pmgroupkaopenprime nmgroupkaopenprime pmgroupkaopen nmgroupkaopen pmgroupfindepprime nmgroupfindepprime pmgroupfindep nmgroupfindep ggdp ifdigdp manugdp, re 


xtreg curgdp old oldlife life ggdp ifdigdp manugdp xgdp, re

eststo clear
$$ Dynamic $$
pvar primesave sigdp curgdp, fod instlags(1/3) exog(capgd)

$$ Baseline $$
pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017  , fod instlags(1/3) exog(capgd) gmmstyle
eststo: quietly pvar primesave sigdp curgdp if counti_sigdp >= 40 & year >= 1978 & year <= 2017, fod instlags(1/3) exog(capgd) gmmstyle

$$$$$ Full Model  $$$$$
 pvar primesave sigdp curgdp rir greer if counti_sigdp >= 40, fod instlags(1/3) gmmstyle exog(lncap)

eststo: quietly pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgrouplife == 1 , fod instlags(1/3) gmmstyle



pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgrouplife == 2 , fod instlags(1/3) gmmstyle
pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgrouplife == 3 , fod instlags(1/3) gmmstyle
pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgroupsocin == 1 , fod instlags(1/3) gmmstyle
pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgroupsocin == 2, fod instlags(1/3) gmmstyle
pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgroupsocin == 3, fod instlags(1/3) gmmstyle
pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgroupkaopen == 1, fod instlags(1/3) gmmstyle
pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgroupkaopen == 2, fod instlags(1/3) gmmstyle
pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgroupkaopen == 3, fod instlags(1/3) gmmstyle
pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgroupfindep == 1, fod instlags(1/3) gmmstyle
pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgroupfindep == 2, fod instlags(1/3) gmmstyle
pvar primesave sigdp curgdp if counti_sigdp >= 30 & year >= 1988 & year <= 2017 & mgroupfindep == 3, fod instlags(1/3) gmmstyle

$$ Full Model $$
pvar primesave sigdp curgdp rir erlcuus, fod instlags(1/3) gmmstyle exog(capgd)


foreach var in life socin kaopen findep {
egen mean = median(`var'), by(country)
pctile cutoff = `var', nq(4) 
egen min = min(cutoff)
egen med = median(cutoff)
egen max = max(cutoff)
g group_`var' = .
replace group_`var' = 1 if mean <= min
replace group_`var' = 2 if mean > min & `var' <= med
replace group_`var' = 3 if mean > med & `var' <= max
replace group_`var' = 4 if mean > max
drop mean min med max cutoff
}

foreach var in group_life group_socin group_kaopen group_findep  {
   bysort country: egen mode_`var' = mode(`var')
}

sort id year
g gprime = 100*((primesave/l.primesave) - 1)
g golddep = 100*((olddep/l.olddep) - 1)
g gagedep = 100*((agedep/l.agedep) - 1)
g gold = ((old/l.old) - 1)
g sigdp = savgdp - invgdp
bysort year: egen countyear_curgdp = count(curgdp)
bysort year: egen countyear_sigdp = count(sigdp)

bysort year: egen year_curgdp = mode(countyear_curgdp)
bysort year: egen year_sigdp = mode(countyear_sigdp)





$$ Stable $$
pvar curgdp prime, fod instlag(1/3) exog(capgd)

pvar primesave sigdp curgdp  if counti_sigdp >= 25 & year >= 1998 & year <= 2017, fod instlag(1/3) exog(capgd)

g yeargroup = "1970s" if year < 1980
replace yeargroup = "1980s" if year < 1990 & year > 1979
replace yeargroup = "1990s" if year < 2000 & year > 1989
replace yeargroup = "2000s" if year < 2010 & year > 1999
replace yeargroup = "2010s" if year > 2009


clear all
use "C:\Users\nprue\Desktop\econ656\balanced.dta"




pvar primesave sigdp curgdp if year > 1989, fod instlag(1/3)





g qopen = .
g qopen = 1 if kaopen <= -1.210019
replace qopen = 2 if kaopen > -1.210019 & kaopen <= -.1411515
replace qopen = 3 if kaopen > -.1411515 & kaopen <= 1.577797
replace qopen = 4 if kaopen > 1.577797

use "C:\Users\nprue\Desktop\econ656\balanced.dta"
 sort country
foreach var in life socin kaopen findep {
egen mean = mean(`var'), by(country)
pctile cutoff = `var', nq(4) 
egen min = min(cutoff)
egen med = median(cutoff)
egen max = max(cutoff)
g group_`var' = .
replace group_`var' = 1 if mean <= min
replace group_`var' = 2 if mean > min & `var' <= med
replace group_`var' = 3 if mean > med & `var' <= max
replace group_`var' = 4 if mean > max
drop mean min med max cutoff
}
tab2 region group
tab2 region group_*
replace group_* = l.group_* if group_* == .
replace group_life = l.group_life if group_life == .
sort country
replace group_life = l.group_life if group_life == .
sort country time
sort country year
replace group_life = l.group_life if group_life == .
bysort country: egen mode(group_life)
bysort country: egen mode_life = mode(group_life)
clear
use "C:\Users\nprue\Desktop\econ656\balanced.dta"
sort country
foreach var in life socin kaopen findep {
egen mean = mean(`var'), by(country)
pctile cutoff = `var', nq(4) 
egen min = min(cutoff)
egen med = median(cutoff)
egen max = max(cutoff)
g group_`var' = .
replace group_`var' = 1 if mean <= min
replace group_`var' = 2 if mean > min & `var' <= med
replace group_`var' = 3 if mean > med & `var' <= max
replace group_`var' = 4 if mean > max
drop mean min med max cutoff
}
foreach var in group_* {
   bysort country: egen mode_`var' = mode(`var')
}
foreach var in group_life group_socin group_kaopen group_findep  
{
   bysort country: egen mode_`var' = mode(`var')
}
foreach var in group_life group_socin group_kaopen group_findep  {
   bysort country: egen mode_`var' = mode(`var')
}
tab2 region mode_*
tab mode_*
dist mode_*
sum mode_*
tab group_life
tab group_socin
xtunitroot lps olddrp
xtunitroot llc olddep
xtunitroot llc old
xtunitroot llc old, trend
xtunitroot llc primesave
xtunitroot llc curgdp
xtunitroot llc savgdp
xtsum group_*
xtsum invgdp
drop country if invgdp == .
drop if invgdp == .
drop if savgdp == .
xtunitroot llc savgdp
clear all
use "C:\Users\nprue\Desktop\econ656\balanced.dta"
sort country
foreach var in life socin kaopen findep {
egen mean = mean(`var'), by(country)
pctile cutoff = `var', nq(4) 
egen min = min(cutoff)
egen med = median(cutoff)
egen max = max(cutoff)
g group_`var' = .
replace group_`var' = 1 if mean <= min
replace group_`var' = 2 if mean > min & `var' <= med
replace group_`var' = 3 if mean > med & `var' <= max
replace group_`var' = 4 if mean > max
drop mean min med max cutoff
}
foreach var in group_life group_socin group_kaopen group_findep  {
   bysort country: egen mode_`var' = mode(`var')
}
xtdes
xtsum
pvar primesave curgdp, exog(capgd)
pvar primesave curgdp, exog(gdp)
pvar primesave curgdp
pvarsoc primesave curgdp
pvar primesave curgdp, lags(3)
pvarstable
pvar primesave curgdp, fod lags(3)
pvarstable
pvar primesave curgdp, fod td lags(3)
pvarstable
pvar primesave curgdp, fd td lags(3)
pvarstable
pvar primesave curgdp, gmmstyle instlags(1/3)
pvarstable
pvar primesave curgdp, gmmstyle instlags(1/2)
pvarstable
pvar primesave curgdp, fd gmmstyle instlags(1/2)
xtsum
sort savgdp
list country if savgdp == .
tab country if savgdp == .
tab country if invgdp == .
tab country if curgdp == .
tab country if primesave == .
list savgdp if country == "ARGENTINA"
list savgdp if country == "Argentina"
sort country
sort country year
pvar primesave savgdp invgdp curgdp if year > 1989
pvarstable
pvarsoc primesave savgdp invgdp curgdp if year > 1989
pvar primesave savgdp invgdp curgdp if year > 1989, lags(1/3)
pvar primesave savgdp invgdp curgdp if year > 1989, lags(3)
pvarstable
pvargranger
pvar primesave savgdp invgdp curgdp if year > 1989
pvarstable
pvargranger
pvarirf
pvarfevd
pvar primesave savgdp invgdp curgdp rir if year > 1989
pvarstable
pvar primesave savgdp invgdp curgdp if year > 1989
pvarstable, graph
pvarirf, porder(primesave savgdp invgdp curgdp)
pvarirf, porder(primesave savgdp invgdp curgdp) level(95)
pvarirf, porder(primesave savgdp invgdp curgdp) level
pvarirf, porder(primesave savgdp invgdp curgdp) level()
pvarirf, porder(primesave savgdp invgdp curgdp) oirf
pvarirf, porder(primesave savgdp invgdp curgdp) level() step(5)
pvarirf, porder(primesave savgdp invgdp curgdp) level() step(5) dm
pvar savgdp invgdp curgdp if year > 1989, exog(primesave)
pvarstable, graph
pvarirf, porder(primesave savgdp invgdp curgdp) level() step(5) dm
pvarirf, level() step(5) dm
pvarirf, level() step(5)
pvarirf, dm
pvar savgdp invgdp curgdp rir if year > 1989, exog(primesave)
pvarirf, dm
g sigdp = savgdp - invgdp
pvar primesave sigdp curgdp if year > 1989
pvarsoc
pvarsoc primesave sigdp curgdp
pvar primesave sigdp curgdp if year > 1989, lags(3)
pvar primesave sigdp curgdp if year > 1989
pvarstable
pvar primesave sigdp curgdp if year > 1989, fod
pvarstable
pvar primesave sigdp curgdp if year > 1989, fod inst(1/3)
pvar primesave sigdp curgdp if year > 1989, fod laginst(1/3)
pvar primesave sigdp curgdp if year > 1989, fod instlag(1/3)
pvarstable
pvarirf
pvarirf, table
pvar primesave sigdp curgdp if year > 1989 & group_life == 1, fod instlag(1/3)
pvar primesave sigdp curgdp if year > 1989 & group_life == 2, fod instlag(1/3)
pvar primesave sigdp curgdp if year > 1989 & group_life == 3, fod instlag(1/3)
pvar primesave sigdp curgdp if year > 1989 & group_life == 4, fod instlag(1/3)
pvar primesave sigdp curgdp if year > 1989 & group_socin == 1, fod instlag(1/3)
pvar primesave sigdp curgdp if year > 1989 & group_socin == 2, fod instlag(1/3)
pvar primesave sigdp curgdp if year > 1989 & group_socin == 3, fod instlag(1/3)
pvar primesave sigdp curgdp if year > 1989 & group_socin == 4, fod instlag(1/3)
pvar primesave sigdp curgdp if year > 1989, fod instlag(1/3) exog(life socin kaopen findep)
pvar primesave sigdp curgdp if year > 1989, exog(life socin kaopen findep)
pvarstable
pvarirf
pvar primesave sigdp curgdp if year > 1989 & group_findep == 1, fod instlag(1/3)
pvar primesave sigdp curgdp if year > 1989 & group_findep == 2, fod instlag(1/3)
pvar primesave sigdp curgdp if year > 1989 & group_findep == 3, fod instlag(1/3)
pvar primesave sigdp curgdp if year > 1989 & group_findep == 4, fod instlag(1/3)
pvar primesave ggdp sigdp curgdp if year > 1989, fod instlag(1/3)
varstable
pvarstable
pvarsoc primesave ggdp sigdp curgdp if year > 1989
g f_curgdp = curgdp/100
pvarsoc primesave ggdp sigdp f_curgdp if year > 1989
pvar f_curgdp ggdp sigdp curgdp if year > 1989, fod instlag(1/3)
pvar primesave ggdp sigdp f_curgdp if year > 1989, fod instlag(1/3)
pvar primesave sigdp f_curgdp if year > 1989, fod instlag(1/3)
pvarstable
pvarirf
pvarsoc primesave sigdp f_curgdp
tab2 country mode_life
tab2 country mode_group_life
tab2 country mode_group_socin
sort country year mode_group_life
by mode_group_life: xtreg f_curgdp primesave
bysort mode_group_life: xtreg f_curgdp primesave
bysort mode_group_life: xtreg f_curgdp primesave i.time
bysort mode_group_life: xtreg f_curgdp primesave i.year
