# Hypothesis 2: Continue and rank data

hai, bertemu lagi dengan aku. kali ini kita akan membahas uji hipotesis untuk data continue dan rank. kalo kata Prof Sis, yang dasar-dasar dulu.

recall sejenak: semakin besar sampel maka semakin besar peluang untuk distribusi datanya menjadi normal.

## T-TEST
biasanya digunakan untuk menguji tes hipotesisi  pada rata-rata populasi tergantung pada variabel tertentu. kita menguji apakah variabel yang kita kumpulkan, nilainya sama dengan **angka tertentu** yang ada di populasi. T-Test ini juga bisa digunakan untuk menguji rata-rata variabel antara dua populasi. pertimbangan selanjutnya adalah apakah dua populasi tersebut berasal dari subjek yang sama.

apabila subjek yang sama, artinya satu subjek dikenai pengukuran lebih dari satu kali, dan ini akan kita sebuat sebagai **paired T-test**

apabila subjek adalah entitas yang berbeda (2 kelompok), maka ini kita sebut sebagai **independen T-test**

pada pengujian T-test, ada pengetesan untuk melihat apakah varian antara dua kelompok ini sama atau tidak sama. hal dapat dilihat melalui **levene test**
  **1. varian sama**: ditunjukkan dengan nilai p-value pada levene test > 0,05
  **2. varian tidak sama**: ditunjukkan dengan nilai p-value pada levene test <0,05

di Stata, uji T-test dapat kita lakukan dengan syntax
```
** untuk one sample-mean T-test
ttest varname = 200

** untuk one sample-mean T-test dengan informasi manual
ttesti n mean sd hipotesis
*** contoh: menguji apakah nilai = 75
ttesti 50 100 15 75

** untuk two sample-mean T-test
ttest varname, by(variabel_kelompok)
```
