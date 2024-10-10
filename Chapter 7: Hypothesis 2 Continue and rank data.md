# Hypothesis 2: Continue and rank data

hai, bertemu lagi dengan aku. kali ini kita akan membahas uji hipotesis untuk data continue dan rank. kalo kata Prof Sis, yang dasar-dasar dulu.

recall sejenak: semakin besar sampel maka semakin besar peluang untuk distribusi datanya menjadi normal.

## T-TEST (Independen and paired)
biasanya digunakan untuk menguji tes hipotesisi  pada rata-rata populasi tergantung pada variabel tertentu. kita menguji apakah variabel yang kita kumpulkan, nilainya sama dengan **angka tertentu** yang ada di populasi. T-Test ini juga bisa digunakan untuk menguji rata-rata variabel antara dua populasi. pertimbangan selanjutnya adalah apakah dua populasi tersebut berasal dari subjek yang sama. asumsi dasar untuk uji ini adalah data terdistribusi normal.

apabila subjek yang sama, artinya satu subjek dikenai pengukuran lebih dari satu kali, dan ini akan kita sebuat sebagai **paired T-test**. asumsi dasar yang melekat disini adalah antar kelompok memiliki varian yang sama. apabila data tidak terdistribusi normal, maka alternatif uji non parametriknya adalah **wilcoxon test**

apabila subjek adalah entitas yang berbeda (2 kelompok), maka ini kita sebut sebagai **independen T-test**. asumsi dasar adalah uji homogenitas dan uji normalitas. apabila data tidak terdistribusi normal maka alternatif uji non parametriknya adalah **Mann-Whitney U test**

pada pengujian T-test, ada pengetesan untuk melihat apakah varian antara dua kelompok ini sama atau tidak sama. hal dapat dilihat melalui **levene test**
  **1. varian sama**: ditunjukkan dengan nilai p-value pada levene test > 0,05
  **2. varian tidak sama**: ditunjukkan dengan nilai p-value pada levene test <0,05

di Stata, uji T-test dapat kita lakukan dengan syntax
```
** untuk one sample-mean T-test
ttest varname = 200
ttest varname = 200, level(90)

** untuk one sample-mean T-test dengan informasi manual
ttesti n mean sd hipotesis
*** contoh: menguji apakah nilai = 75
ttesti 50 100 15 75
ttesti 50 100 15 75, level(90)

** untuk two sample-mean T-test
ttest varname, by(variabel_kelompok)
```
lantas, bagaimana melihat hasilnya

![image](https://github.com/user-attachments/assets/b379fac7-a953-498d-89bf-d13be26dc4bb)

**Ha: diff != 0** artinya	Two-sided t-test.
**Ha: diff < 0**	artinya One-sided t-test (left tail)
**Ha: diff > 0**	artinya One-sided t-test (right tail)

untuk menguji varian, bisa dilakukan dengan syntax

```
robvar varname, by(variabel_kelompok)
```

ketika data menunjukkan varian tidak sama, maka uji independent T-test dalam dilakukan dengan syntax
```
ttest varname, by(variabel_kelompok), unequal
```

Adapun untuk uji **paired T-test** dapat menggunakan syntax berikut:
```
ttest vargroup1 = vargroup2
```

## Wilcoxon signed rank test
untuk alternatif uji non parametrik dari paired T-test
```
signrank vargroup1 = vargroup2
```
