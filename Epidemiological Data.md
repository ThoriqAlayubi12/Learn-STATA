# Analisis Epidemiological Data

## Measures of Association
we often obtain 2x2 tables for almost all design study.

dengan nilai
- phi1 = proporsi sakit pada expose atau P(disease|expose)
- phi2 = proporsi sakit pada non-expose atau P(disease|non-expose)

maka kita bisa mendapatkan beberapa ukuran berikut:
- **Risk Difference** = phi1 - phi2
- **Risk Ratio (Relative Risk)** = phi1/phi2
- **Odds Ratio (Cross Product Ratio)** = phi1/(1-phi1) dibagi phi2/(1-phi2).

di stata bisa pakai
```
csi a c b d, exact or
csi a c b d, exact or woolf
```

## mantel hanzel chi square pada case control yang tidak matching (untuk confounding)
di stata bisa pakai

```
cc malaria sex [fweight=tally], by(occupation)
```

## Matching -McNemar
penyajian seperti ini

![image](https://github.com/user-attachments/assets/26f0da5f-2836-4000-805f-8083d10d511c)

```
mcci a b c d
```
## conditional logistic regression

dalam cond. logreg jumlah n adalah banyaknya pasangan bukan banyaknya sampel.

```
 use "lowbirthweight", clear
clogit low lwt smoke ptd ht ui i.race, group(pairid) nolog
clogit low lwt smoke ptd ht ui i.race, group(pairid) nolog or
** untuk melihat contrastnya
test 2.race 3.race
```

## Agreement Analysis
untuk situasi dimana tidak tau gold standard untuk suatu pengukuran

```
use "kappa.dta", clear
tab2 self measure [fweight=pop]
kap self measure [fweight=pop], tab
```
