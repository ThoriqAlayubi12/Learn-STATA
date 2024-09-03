# CHAPTER 1: MANAGEMENT DATA
di chapter ini, kita akan belajar mulai dari hal basic tentang stata sampai dengan managemen data sederhana. tentu, ini ditulis sembari mendengarkan full album dari Bernadya.

## MENENTUKAN DIRECTORY KERJAAN
hal ini berguna untuk menentukan dimana hasil kerjaan kita lakukan dan simpan nantinya

```{stata}
cd "C:\Users\Thoriq Al Ayubi\Documents\output stata"
```
link directory diatas dapat diganti/disesuaikan berdaasarkan _working directory_ yang ada di komputer/laptop masing-masing

## SIMPAN LOG
fungsi ini berguna untuk merecord apa yang kita analisis. ada dua jenis, **.log** untuk jenis yang bisa dibuka di notepad dan **.smcl** untuk yang bisa dibuka di notepad dan stata itu sendiri

* format penyimpanan **.log**
```{stata}
log using namafile.log
```
* format penyimpanan **.smcl**
```{stata}
log using namafile.smcl
```
log dapat kita tutup apabila kita sudah selesai melakukan analisa. Adapun cara menutup log adalah dengan perintah
```{stata}
log close
```
## MEMASUKKAN DATASET
### dataset format excel
gunakan perintah **import excel** dengan melakukan customisasi pada url directory berdasarkan lokasi file masing-masing
```{stata}
import excel "C:\Users\Thoriq Al Ayubi\Documents\kuliah FETP UGM\semester 1\MKDU biostatistika\introduction stata\smalldataset.xlsx", sheet("namasheet") firstrow clear
```
apabila datafile sudah berada dalam working directory yang kita tentukan, kita bisa sederhanakan menjadi
```{stata}
import excel "namafile.xlsx",sheet("namasheet") firstrow clear
```
### dataset format .dta
```{stata}
use "C:\Users\Thoriq Al Ayubi\Documents\kuliah FETP UGM\semester 1\MKDU biostatistika\introduction stata\brainmeta.dta", clear
```
apabila berada dalam satu direktori yang sama maka bisa langsung
```{stata}
use "brainmeta2.dta", clear
```
## MENAMPILKAN SUMMARY DATA
untuk menampilkan summary dari data, ada beberapa perintah yang dapat digunakan diantaranya adalah:
* perintah **describe** untuk menampilkan karakter variabel dalam data
```{stata}
describe
```
* perintah **summarize** untuk menampilkan ringkasan deskriptif dari variabel dalam dataset
```{stata}
summarize
```
* untuk custom pada beberapa variabel/variabel tertentu, dapat menggunakan
```{stata}
summarize variabel1 variabel2
```

## MENAMPILKAN ROW DATA
untuk menampilkan row data, kita bisa menggunakan beberapa perintah diantaranya
```{stata}
browse
```
```{stata}
edit
```
```{stata}
browse variabel if kriteria
```
```{stata}
list in 1/10
```
Perintah **browse if** digunakan menampilkan data dengan kriteria tertentu.

Perintah **edit** digunakan untuk menampilkan data dengan mengaktifkan fitur edit secara langsung.

Perintah **list in** digunakan untuk menampilkan overview data sebanyak angka yang diatur

## MENGUBAH TIPE DATA
untuk mengubah tipe data dari _non string_ menjadi _string_ pakai **TOSTRING**

sedangkan dari _string_ menjadi _non string_ pakai **DESTRING**
* mengganti data yang lama
```{stata}
tostring variabel, replace
destring variabel, replace
```
* menambahkan sebagai variabel baru
```{stata}
tostring variabel, gen(namavariabelbaru)
destring variabel, gen(namavariabelbaru)
```

## MEMBUANG VARIABEL
drop variabel menggunakan kriteria
_contoh: variabel yang nilainya = 1 akan didrop_
```{stata}
drop if variabel==1
```
_contoh lebih dari 1 kriteria_
```{stata}
drop if variabel == 1 & variabel == 2
```

## MENJAGA VARIABEL
keep variabel menggunakan kriteria tertentu
_contoh: variabel yang nilainya = 1 akan didrop_
```{stata}
keep if variabel==1
```
_contoh lebih dari 1 kriteria_
```{stata}
keep if variabel == 1 & variabel == 2
```

## LABELING VARIABEL
```{stata}
label define namalabel 1"label1" 2"label2"
label value variabel namalabel
```

## MEMBUAT VARIABEL BARU
```{stata}
gen variabelbaru = rumus
```
* Dengan kriteria yang menghasilkan 2 kategori, maka cukup dituliskan nama kategori yang mendapatkan **kode 1**
```{stata}
gen variabelbaru = variabellama >2
```
dari contoh diatas maka kode 1 akan dikenakan pada data dengan kriteria varlama >2. untuk beberapa operasional penjumlahan dengan nilai _missing_, maka dapat menggunakan
```{stata}
egen variabelbaru = rowtotal(kriteria1 kriteria2)
```
nb: kriteria disesuaikan dengan rumus masing-masing.

* sedangkan untuk kriteria lebih dari 2 dapat menggunakan code berikut
```{stata}
recode variabellama (1/5=1"label1")(6/10=2"label2")(11/15=3"label3"),gen(variabelbaru)
```
dari script diatas,

1/5 artinya dari 1 sampai 5

6/10 artinya dari 6-10,

dan 11/15 artinya 11-15

## IDENTIFIKASI MISSING VALUE
```{stata}
misstable summarize
```
**untuk melihat pola dalam bentuk persentase data**
```{stata}
misstable pattern
```

## SAVE DATA SEBAGAI FILE FORMAT: DTA
```{stata}
save "namafile.dta",replace
```

kamu sudah sampai sini? selamat, chapter 1 selesai dahulu. jangan lupa untuk selalu tersenyum dan bersyukur

jabat hangat dari saya,

Moch. Thoriq Assegaf Al-Ayubi





