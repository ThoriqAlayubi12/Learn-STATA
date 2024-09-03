# CHAPTER 2: BASIC TABLE VISUALIZATION
hai, Berjumpa lagi dengan aku, Moch. Thoriq Assegaf Al-Ayubi. kali ini kita akan coba mendokumentasikan perihal tabulasi di stata, semoga bermanfaat (masih mendengarkan Bernadya)

## MELIHAT FREKUENSI 1 VARIABEL
* melihat distribusi data kategorik
```{stata}
tab namavariabel
```
apabila peneliti ingin melihat distribusi data kategorik banyak variabel maka dapat menggunakan perintah
```{stata}
tab1 variabel1 variabel2 variabel3
```
* melihat distribusi data numerik
```{stata}
summarize namavariabel
```
apabila ingin melihat secara detail seperti distribusi persentil maka bisa menggunakan
```{stata}
summarize namavariabel, detail
```

## FREKUENSI 2 VARIABEL
```{stata}
tab variabel1 variabel2
```
variabel 1 untuk variabel yang menurun (biasanya exposure)

variabel 2 untuk variabel yang menyamping (biasanya outcome)

adapun untuk menampilkan nilai kodingan (bukan label) dapat menggunakan perintah
```{stata}
tab variabel1 variabel2, nolabel
```
### Persentase by column
ini berfungsi untuk data _case control_ atau ingin melihat sebaran berdasarkan variabel _outcome_
```{stata}
tab variabel1 variabel2,col
```
### Persentase by row
ini berfungsi untuk data _cross sectional_ atau _kohort_ atau ingin melihat sebaran berdasarkan variabel _exposure_
```{stata}
tab variabel1 variabel2,row
```
### Persentase by column dan row
```{stata}
tab variabel1 variabel2, row col freq
```
### melihat nilai tertentu berdasarkan sub-kategori dalam 1/lebih variabel
```{stata}
tab variabel,sum(age)
tab variabel1 variabel2,sum(age)
```
pada perintah diatas, yang dilihat berdasarkan kategori variabel adalah karakteristik usia

### Tabulasi persentase dengan tanpa nilai absolut
```{stata}
tab variabel1 variabel2, row nofreq
```

## FREKUENSI UNTUK LEBIH DARI 2 VARIABEL
untuk melihat frekuensi lebih dari 2 variabel, maka akan dibagi menjadi sub-kategori mulai dari variabel ke 3
* pastikan tidak ada yang _missing_
* ```{stata}
keep if variabel !=.
```
artinya memastikan variabel yang missing sudah dihilangkan
```{stata}
bysort variabel3: tab variabel1 variabel2
bysort varaibel4 variabel3: tab variabel1 variabel2
```
cara lain untuk tabulasi berjenjang lebih dari 2 variabel adalah dengan perintah sebagai berikut:
```{stata}
tab variabel1 variabel2 variabel3
```
## MEMBUAT TABEL SUMMARY
```{stata}
basetable _none variabel1(c) variabel2(%5.1f,ci) variabel3(c),toxl(namafile.xlsx, namasheet, replace)
```
**(c)** artinya data adalah kategorik

**(%5.1f,ci)** artinya adalah data numerik dengan 1 angka dibelakang koma dan ditambahkan nilai CI

**toxl** itu artinya hasil diexport ke format excel, makanya ada _**.xlsx**_

## CUSTOM TABEL
```{stata}
tabstat var1 var2 var3, s(mean semean median sd var skew k count sum range min max)
```
untuk isian dalam s() dapat disesuaikan dengan kebutuhan nilai yang dicari

custom tabel juga bisa didasarkan pada pengelompokan variabel dengan menambahkan perintah **by()**
```{stata}
tabstat var1 var2 var3,by(warna) s(mean semean median sd var skew k count sum range min max)
```
dari contoh diatas maka tabel akan dibedakan berdasarkan **warna**

## Additional Information
### Weighting Data
```{stata}
use "idhs_balance_table.dta",clear
svyset psu [pw=weight], strata(strata) vce(linearized)
tabxml, dv(variabeldep) ivd (variabel1 variabel2 variabel3) percent(col) labcoln (n=) olines tformat(1) display bold pval pdec(3) chi2 justify(r) order(variabel1 variabel2 variabel3) save("balanceweighted")
```

### unweighting Data
```{stata}
tabxml, dv(variabeldep) ivd (variabel1 variabel2 variabel3) percent(col) labcoln (n=) olines tformat(1) display bold pval pdec(3) chi2 sp justify(r) osvy save("balanceunweighted")
```
penjelasan rumus diatas adalah
* **dv** untuk variabel dependen
* **ivd** untuk variabel independen
* **percent** untuk menentukan persentasenya column atau row
* **labcoln** untuk memberikan label pada kolom
* **display** ini untuk menentukan output tabel bisa meliputi:
* **bold** : bold variabelnya
* **p-value** : nilai p-value
* **pdec** : data deskripsi
* **chi2** : hasil chi square
* **justify** : untuk set paragraf. r artinya right atau rata kanan
* **osvy** : command untuk unweight

selamat, kamu sudah sampai sini. maka sudah dulu ya untuk belajar di chapter 2 kali ini. semoga sehat selalu dan jangan lupa bersyukur

untuk segala pertanyaan tentang postingan ini, kamu bisa menghubungi aku via instagram @thoriq.alayubi

Jabat Hangat dari Saya,

Moch. Thoriq Assegaf Al-Ayubi
