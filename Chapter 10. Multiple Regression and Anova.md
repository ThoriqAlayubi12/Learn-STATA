# Multiple Regression and Anova
kuliah oleh: Prof Siswanto Agus Wilopo

## Multiple Linier Regression
persamaan dasar untuk multiple linier regression adalah

![image](https://github.com/user-attachments/assets/9f8475ab-0c61-447b-9809-4220d129fb63)

multiple linier adalah regresi untuk variabel dependen berupa **continuous/quantitative data** dengan jumlah variabel prediktor lebih dari satu.

ada beberapa asumsi yang harus dipenuhi ketika menggunakan model ini, disebut least square appoarch, yaitu:

**1. normalitas regresi, menggunakan uji skewness kurtosis atau shapiro wilk**
```
regress vardep varind1 varind2 varind3
predict res,r
qnorm res
sktest res
swilk res
```
dikatakan normal apabila p-value > 0,05

**2. heterokedastisitas**
```
estat hettest
rvfplot, yline(0) graphregion(fcolor(white))
```
melihat adanya pola tertentu atau tidak

**3. Multikolinearitas, dilihat dari nilai VIF**
```
estat vif
estat collin
```
asumsi terpenuhi apabila VIF<10 dan >0.1

**4. interaksi antar variabel independen.**
```
acprplot
```

**5. independen of error atau autokorelasi**
```
regress y x1 x2 x3
dwstat
```

**6. linearity**
```
regress y x1 x2 x3
rvfplot
```
melihat antara variabel dependen dengan variabel independen apakah memiliki hubungan yang linier

dalam regresi, ada asumsi bahwa variabel prediktor lain dalam model adalah konstan, sehingga dalam interpretasinya harus ada narasi _"controlling for the other variables"_

dalam stata, menggunakan perintah `regress` dengan diikuti variabel dependen dan kemudian variabel independen
```
regress vardep varind1 varind2 varind3
regress vardep i.varind1 b(2)i.varind2 lb.varind3
**untuk mengganti CI dengan nilai beta
regress vardep i.varind1 b(2)i.varind2 lb.varind3, beta
```

`i.` pada `i.varind1` menunjukkan bahwa pada variabel independen 1 diambil kategori pertama sebagai reference

`b(2)i.` pada `b(2)i.varind2 menunjukkan bahwa kita set kategori 2 dalam variabel independen 2 sebagai reference

`lb.` pada `lb.varind3` menunjukkan detail regresi pada masing-masing kategori dalam variabel independen 3

untuk variabel kategori, analisis regresi linier akan ideal apabila variabel kategori dibuat dummy (0,1)

## analysis on Variance (Anova)
```
anova vardep varindep1 varindep2
```
