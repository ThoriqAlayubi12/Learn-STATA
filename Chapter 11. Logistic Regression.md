# Logistic Regression
kuliah disampaikan oleh, the one and only, Prof. Siswanto

nilai probability (diwakili oleh phi)

![image](https://github.com/user-attachments/assets/8e9ad6eb-b01e-4c56-8611-213176c9d8c5)

regresi logistik akan menjawab dan mengestimasi nilai phi dengan rentang 0 sampai 1 dan selalu positif

kita biasanya menghitung likelihood untuk menghasilkan koefisien beta. disini kita bisa memaksimalkan likelihood untuk mendapatkan nilai koef beta yang ideal.

kenapa log likelihood penting? dalam menyeleksi model, kita bisa menentukan mana model yang lebih baik. rumusnya = 2*log likelihood

`logit` menghasilkan koefisien sedangkan `logistic` menghasilkan odds ratio, bisa ditambahkan `coef` pada `logistic` sebagaimana berikut

```
logistic vardep varindep1 varindep2, coef
logistic vardep varindep1 varindep2
logit vardep varindep1 varindep2
```

## ploting or dan ci dalam regresi logistic

```
use "frmgham2.dta", clear
*buat label secara lengkap
lab val cursmoke vyesno_lab
lab val prevhyp yesno_lab
lab val hyperten yesno_lab
lab val stroke yesno_lab
lab val angina yesno_lab
lab val diabetes yesno_lab
lab val cursmoke yesno_lab
gen age10 =age/5
drop age
clonevar age=age10

* regresi logistic
logistic prevchd age i.hyperten i.stroke i.diabetes i.cursmoke

* membuat grafik, jika pertama kali ketik dulu ssc install coefplot

coefplot, eform xline(0, lcolor(midblue)) mcolor(midblue) graphregion(fcolor(white)) scale (0.75) horizontal pstyle(p4) msymbol(S) headings (age= "{bf:Respondent age}" ///
1.cursmoke= "{bf: Current Smoking}" 1.hyperten= "{bf: Hypertension}" 1.stroke= "{bf: Stroke}" 1.diabetes= "{bf: Diabetes}") ///
mlabel format(%6.3g) mlabposition(12) mlabgap (*2) drop(_cons) xline(1)
```
## untuk melihat model mana yang paling fit dan ideal

### Uji F Partial
```
** harus store modelnya dulu ya
ftest m1 m2
```

### uji likelihood
```
lrtest m1 m2
** pvalue >0,05 maka variabel tambahan tidak berguna, asas: simple is better
```

### membandingkan AIC dan BIC
```
est stat m1 m2
** AIC digunakan ketika kita explorasi sedangkan BIC untuk konfirmasi
** nilai yang lebih rendah yang kita gunakan karena menunjukkan model yang lebih ideal
```

### cara menjadi transformasi data yang lebih ideal
```
ladder vardep
```
