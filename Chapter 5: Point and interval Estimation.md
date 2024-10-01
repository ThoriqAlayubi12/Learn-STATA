# Chapter 5: Point and Interval Estimation

kuliah disampaikan oleh Prof. Sis di Auditorium. ditulis setelah makan nasi dadar tempe mie. **Mari belajar!**

dinamika perkembangan kepenulisan ilmiah saat ini mengarah pada penggunaan confidence interval (CI) bahkan pada penyajian data deskriptif.

pada dasarnya, penggunaan nilai p-value pada pengujian hipotesis memiliki celah diantaranya: apabila kita menolak hipotesis, ukuran besaran kuantitatif kadang dipertanyaan. kesimpulan: tidak efektif, maka bisa dipertanyakan, seberapa efektif memang? oleh karena itu, penting untuk penyampaikan **interval**

selain itu, penggunaan interval juga dapat digunakan untuk melihat variasi.

dalam CI 95% misalnya, rentang upper dan lower berkaitan dengan potensi pengulangan prosedur yang sama di populasi akan menunjukkan hasil yang sama sebesar 95%, dan hanya 5% yang hasilnya diluar rentang lower-upper. hal ini juga relevan dengan penggunaan **statistika inferesial** dimana hasil dari sampel dapat menggambarkan keadaan yang ada di populasi. CI adalah _the sort-long-run guarantee_ dalam komunitas kepenulisan ilmiah.

dasar penggunaan probabilitas dalam statistika adalah karena adanya aspek "ketidakpastian" dalam kehidupan yang fanaaaa inii.

statistika inferential diukur melalui tiga cara yaitu:
- p-value
- nilai hitung > nilai tabel
- 95% CI --> berkaitan dengan interval estimation. terbagi pada cut of 0 untuk numerik (different mean) dan cut of 1 untuk kategorik (RR/OR)

## rule of thumb untuk CI

signifikansi point (dalam uji hipotesis): p-value, ditentukan oleh batas nilai alfa, biasanya 5% atau 0,05. pembagian signifikansi didasarkan pada
- Ho gagal ditolak (p-value > 0,05), artinya H0 yang kita uji berada didalam rentang CI
- Ho ditolak (p-value < 0,05). artinya H0 yang kita uji akan berada diluar rentang CI

dalam penelitian, yang kita buktikan adalah kita berhasil menolak yang tidak kita mau, sehingga pada dasarnya kita tidak perlu membuktikan apa yang kita mau. uji hipotesis berkaitan dengan uji statistika pada sampel. kelemahannya adalah uji hipotesis tidak bisa menunjukkan effect size yang terjadi.

signifikansi interval: CI, ditentukan oleh lebar variasi dari lower-upper. CI menjadi inconclusive apabila rentang lower-upper melewati nilai OR=1. selain itu, semakin lebar rentang CI menunjukkan semakin sulit bagi kita untuk memastikan hasil yang mendekati nilai pointnya.

berkaitan dengan hal ini, ada tiga hal yang bisa kita liat:
- nilai CI itu sendiri. variasi yang besar berdampak pada rentang CI yang lebar
- besaran informasi yang kita kumpulkan. semakin besar sampel semakin kondusif rentang CI. hal ini berkaitan dengan optimasi penelitian berdasarkan pada perhitungan besaran sampel
- presisi pengukuran

cara interpretasi CI adalah **95% popuilasi memiliki rata-rata variabel di range CI tersebut**
artinya pada 95%: 5% ruang untuk error random, sedangkan 95% adalah garansi dari error sistematik (bias confounding, dkk)

dengan kondisi yang sama, peningkatan taraf CI akan berdampak pada pelebaran interval, sedangkan pada preliminary, peningkatan taraf CI berdampak pada peningkatan sampel dan menyempitkan CI (lebih presisi)
**review OR sejenak**

OR=1 artinya tidak ada signifikansi atau hubungan

OR>1 artinya adanya **faktor risiko**

OR<1 artinya adanya **faktor protektif**

**CI berkaitan dengan parameter (di populasi) dan effect size**

## Model inferential
model inferential dibagi menjadi dua yaitu:
- Estimation: estimasi nilai pada parameter (di populasi) dan jumlah ketidakpastian dalam estimasi kita
- hypothesis testing: nilai point untuk parameter dan menguji berdasarkan data yang ada pada sampel.

### asumsi dasar
dalam estimasi, asumsi dasar adalah

```
Y (estimator) = miu (parameter asli)
```
artinya distribusi dari Y = distribusi miu sehingga dikatakan **distribusi normal**

asumsi kedua adalah **variance diketahui**

apabila nilai variance tidak diketahui, maka dapat diasumsikan dengan perhitungan **s^2** dengan **s adalah standar deviasi yang ada dari sampel**

apabila menggunakan nilai dari standard deviasi, maka distribusi menjadi **tidak normal**. apabila tidak normal maka mengikuti _t distribution or chi square_

dalam meninjau distribusi, dikaitkan dengan degree of freedom (df).

rumus CI untuk mean adalah

![Cinfidence-Interval](https://github.com/user-attachments/assets/10d2c3b4-4a98-4a26-b015-d90d82e53b9f)

sedangkan rumus CI untuk proporsi adalah

![image](https://github.com/user-attachments/assets/14432c4c-d971-4107-a981-64773cd3c333)

dengan nilai p = proporsi sampel

apabila nilai variance tidak diketahui (pakai t distribution) maka gunakan rumus

![image](https://github.com/user-attachments/assets/29433f62-c6ad-4dfc-a5c8-f5e0a727a655)

secara detail, rumus CI adalah sebagai berikut:

![image](https://github.com/user-attachments/assets/f353080d-b2a1-424b-ae6e-e2b54ec362be)


## Ini sesi paling seru, praktik di Stata

perintah dasar untuk CI adalah
```
#untuk data numerik
ci mean v1 v2
ci mean v1 v2, level(99)
cii mean n x s #untuk sampel yang kecil dengan n adalah sampel, x adalah rata-rata, dan s adalah standar deviasi sampel

#untuk data proporsi
ci proportion v1
cii proportion N v1,agresti  #dengan N adalah total sampel dan v1 adalah data yang ingin dilihat
```
by default, apabila kita tidak menuliskan level CI nya maka akan dianggap sebagai 95%

untuk lebih lengkap, command untuk CI dapat dilihat pada gambar dibawah ini

![image](https://github.com/user-attachments/assets/3e5a952e-6c5b-4641-9ff6-57e06b7da29a)

![image](https://github.com/user-attachments/assets/f64acc65-4c38-4b49-9920-95f4084f2a8b)

![image](https://github.com/user-attachments/assets/1cf938ca-3634-4577-bc2d-35b2c7b00593)

## CI pada data yang tidak normal

pada data yang tidak normal, kita menggunakan central limit theorem (CLT). informasi lebih lanjut tentang CLT dapat kami akses di link berikut:

https://statisticsbyjim.com/basics/central-limit-theorem/

pada sampel yang kecil, test normalitas sulit untuk dilakukan. biasanya akan kita lakukan transformasi data untuk mengupayakan asumsi normalitas terpenuhi. selain itu juga bisa dilakukan metode non paramterik seperti:
- boostraping t interval: metode teknik untuk estimasi parameter dan variabel dalam populasi ketika kita ingin mengambil nilai mean dan variasi, secara terus menerus pada data simulasi yang sudah kita tentukan. biasanya kita akan mengatur besaran nilai boostrap (B), misal: 500,1000, dsb
- CI for median

## latihan pada STATA

rumus umum
```
ci mean varname
ci proportion varname
by var1: ci mean varname
```

untuk custom nilai bisa menggunakan
```
cii means n mean sd #untuk t distribution, defaultnya 95
cii means n mean sd, level(99)
```

## uji one sample

untuk asumsi distribusi normal atau z distribution
```
ztesti n mean sd nilai_yang_diuji
ztest varname == 120 #nilai yang diuji hipotesisnya
ztest varname == 120, level(99)
```

untuk asumsi distribusi tidak normal atau t distribution
```
ttest varname == 120 #nilai yang diuji hipotesisnya
ttest varname == 120, level(99)
ttesti n mean sd nilai_yang_diuji
ttesti n mean sd nilai_yang_diuji, level(99)
```
## ilmu baruuuu

untuk reshape data long to wide or vise versa
```
#long ke wide
reshape wide varname1 varname2, i(id) j(period)
#mengembalikan
reshape long

#wide ke long --> j adalah new variable
reshape long varname1 varname2, i(id) j(period)
#mengembalikan
reshape wide
```

untuk ztesti yang dilihat yang **ha:mean !=**

bisa juga menggunakan

sebentar, lanjut nanti, baterai lowbat boss
