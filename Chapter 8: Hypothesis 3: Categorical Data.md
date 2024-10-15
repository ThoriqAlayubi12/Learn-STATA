# Hypothesis 3: Categorical data
catatan dibuat setelah makan di kantin, aku habis 20ribu hanya karena ambil nasinya banyak, kok bisa ya, kukira model prasmanan gitu hahaha, oke lanjut yak

## comparing two proportions
dalam membandingkan dua proporsi, family paling sering adalah binomial yaitu membagi proporsi menjadi dua kelompok (binomial distribution). dalam melihat komparasi, usahakan data kita format dalam 2x2 tabel.

## Fisher exact test
fisher exact digunakan ketika menggunakan asumsi margin antar kategori dalam variabel adalah **fixed**. selain itu, uji ini mengikuti _distribusi hypergeometric_ **karena sampel kita kecil**.

fixed disifati pada n1, n2, m1, dan m2

![image](https://github.com/user-attachments/assets/33077a6a-e7fa-46ff-9fb3-d3eaf2b4221d)

pada tabel diatas, **nilai n1,1 diupayakan sebagai nilai sel yang paling kecil** untuk menghitung probabilitas sehingga bisa melihat kumulatif distribusi dari _hypergeometric_.

Formula _distribusi hypergeometric_
![image](https://github.com/user-attachments/assets/6af502bd-2dd9-4cbf-8849-9050c640d2f3)

fisher exact hanya melihat hasil **one-tail**

di stata, kita bisa menggunakan syntax
```
tabi 1 19\ 7 369, exact
tabi a b/c d,exact
```

## Comparing two proportion: Large Sample
mengikuti normal distribution. bisa juga menggunakan nilai z test dengan mencari nilai p1 dan p2

p1 = a/a+b , artinya probabilitas outcome pada exposure

p2 = c/c+d, artinya probabilitas outcome pada non exposure

## chi square test (large size)

biasanya menggunakan 2x2 tabel

chi square test bisa disebut juga sebagai "pearson" chi-square statistic

di stata, kita bisa menggunakan syntax
```
tabi 1 19\ 7 369, chi
tabi a b/c d,chi exact
tab var1 var2, col chi2
```

## Table Contigensi
untuk tabel bukan 2x2 atau kita sebut **r x c**

biasanya dilakukan test independen dengan chi square test

di stata, kita bisa menggunakan syntax ini untuk menunjukkan **expected value**
```
tab var1 var2 [fweight=var3], expected chi2 nofreq
```

`expected` untuk menunjukkan nilai expected

`nofreq` untuk tanpa nilai absolut

`[fwieght=var3]` untuk menunjukkan bahwa tabulasi dikenai pembobotan berdasarkan var3 (nilai yang ditengah)

## Chi Square Test Trend pada Data Ordinal

kita bisa melihat ada tidaknya trend pada suatu data penyakit dengan data ordinal

setting up-nya:
- column = data ordinal dan berupa exposure
- row = data penyakit

contoh hipotesisnya adalah
![image](https://github.com/user-attachments/assets/a8c48c3d-12e2-478c-bfac-1eab1fb2a6bc)

hipotesis alternatifnya adalah tidak ordinal.

pada Rstudio, syntax yang bisa kita gunakan adalah
```
* dengan data manual
prop.trend.test(c(1,5,5,14),c(47,69,44,90))
```

`c(1,5,5,14)` adalah nilai pada disease positif berdasarkan data ordinal
`c(47,69,44,90` adalah nilai pada disease negatif berdasarkan data ordinal

sedangkan pada stata, kita bisa membuat syntax
```
input byte (x count0 count1)
** ini di custom berdasarkan tabulasi data manual kita ya guys. berurutan baris pertama adalah data ordinalnya, baris kedua adalah sebaran data pada disease positif, baris ketiga adalah sebaran data pada disease negatif
1 1 46
2 5 64
3 5 39
4 14 76
end
quietly reshape long count, i(x) j(y)
 quietly correlate y x [fweight=count]
tempname Qtrend
 scalar define Qtrend = r(N) * r(rho)^2
display in smcl as text "Qtrend = " as result Qtrend as text ", p = " as result chi2tail(1, Qtrend)
```

## Chi Square Test Goodness of Fit

ini adalah cara untuk melihat fit model yang ideal pada data chi square kita. untuk bahan bacaan lebih lanjut, bisa dibaca [disini](https://stats.libretexts.org/Bookshelves/Applied_Statistics/Mikes_Biostatistics_Book_(Dohm)/09%3A_Categorical_Data/9.1%3A_Chi-square_test_and_goodness_of_fit)

sudah selesai pusingnya, yeaahhhh _-
