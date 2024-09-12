# Chapter 3: Graph Visualization
kuliah: Prof Siswanto pada hari Selasa, 10 September 2024

mari kita awali dengan doa supaya ilmu yang kita dapatkan bisa bermanfaat, aamiin

grafik adalah sebuah seni dimana apabila digunakan dengan baik dia bisa merangkum lebih banyak informasi daripada tabel.

## Frequency Graph
Eksplorasi pada grafik ini biasanya disajikan dalam dua pendekatan:

1) kasus baru,

2) kasus kumulatif. ada dua penyebutan yaitu _**concave up**_ untuk peningkatan dan _**concave down**_ untuk penurunan (idealnya dalam kasus kumulatif tidak ada penurunan). pada kondisi concave up, biasanya kurva akan membentuk **S-shapes**.

Distribusi bisa didasarkan pada beberapa segmen, yaitu:

a. berdasarkan waktu atau trend. hal ini menjadi modal dasar dalam identifikasi masalah di populasi

b. berdasarkan variabel kategori

c. kolabaorasi berdasarkan variabel kategori dan waktu, biasanya menggunakan stacked graph atau area chart.

## Polygon chart (line chart)
graph ini bisa digunakan untuk melakukan komparasi.

```{stata}
line garis1 garis2 garis3 variabelx if variabel=="kriteria", ///
title("ini untuk judul") ///
legend(label(1 "label garis1") label(2 "label garis2") label(3 "label garis3")) ///
lpattern(solid dash dash_dot) ///
msymbol(circle diamond square) ///
ytitle("Percentage")
```
perintah **lpattern** digunakan untuk mengatur bentuk garis yang ditampilkan dalam grafik

perintah **msymbol** digunakan untuk memberikan simbol pada titik dalam garis

### membuat banyak line chart

teman-teman bisa menggunakan perintah **by** . penampilan ini biasa disebut sebagai facewrap sebagaimana contoh berikut:

A. tanpa _facewrap_
```{stata}
twoway (connected garis1 variabelx if variabelpisah=="kriteria1", msymbol(diamond_hollow)) ///
(connected garis2 variabelx if variabelpisah=="kriteria2", msymbol(triangle_hollow)) ///
(connected garis3 variabelx if variabelpisah=="kriteria3", msymbol(square_hollow)) ///
(connected garis4 variabelx if variabelpisah=="kriteria4", ///
title("judulnya apa") ///
msymbol(circle_hollow) ///
legend(label(1 "label garis1") label(2 "label garis2") label(3 "label garis3") label(4 "label garis4")))
```
B. dengan _facewrap_

```{stata}
twoway connected garis1 variabelx if ///
variabelpisah=="kriteria 1" | ///
variabelpisah=="kriteria 2" | ///
variabelpisah=="kriteria 3" | ///
variabelpisah=="kriteria 4", ///
by(variabelpisah, title("kasih judul grafik")) ///
msymbol(circle_hollow)
```

C. _facewrap_ dengan lebih dari 1 garis
```{stata}
twoway connected garis1 garis2 variabelx if ///
variabelpisah=="kriteria 1" | ///
variabelpisah=="kriteria 2" | ///
variabelpisah=="kriteria 3" | ///
variabelpisah=="kriteria 4", ///
by(variabelpisah, title("kasih judul grafik")) ///
legend(label(1 "label garis1") label(2 "label garis2")) ///
msymbol(circle_hollow)
```

## Histogram chart
graph  ini bisa digunakan untuk melihat distribusi data numerik dalam kelas-kelas interval. graph ini membantu untuk melihat asumsi normalitas distribusi data.

histogram lebih efektif dalam melihat relative frequencies dibandingkan dengan actual frequencies.

contoh membuat histogram chart di stata:

```{stata}
use "dataset.dta", clear
label variables umur (umur penderita kanker)
histogram umur
histogram umur, normal
```
dengan script diatas maka nilai yang ditampilkan dalam histogram adalah **nilai density**

untuk mengaturnya kita bisa atur setelah script utama
```{stata}
use "dataset.dta", clear
label variables umur (umur penderita kanker)
histogram umur, frequency
histogram umur, fraction
histogram umur, kdensity
histogram umur, kdensity normal
histogram umur, discrete
```
kita bisa menambahkan label dan judul

```{stata}
histogram umur,
xtitle ("label axis x")
title ("judulnya ini")
subtitle ("ini subjudulnya")
graphregion (fcolor(white))
note("label untuk catatan kecil")
```

untuk memisahkan baris pada satu perintah yang sama, bisa juga menggunakan tanda **///**

jangan lupa untuk menyesuaikan interval kelas dalam histogram. penyesuaian ini berguna untuk memperindah visualisasi data. di stata kita bisa mengatur dengan perintah **bin**.

secara otomatis, pengkategorian dalam software analisis mengikuti _sturges rule_ = log2(n)

### face wrap histogram
histogram juga bisa menggunakan perintah **by**

```{stata}
hist var1, by(var2)
```

## Pie Chart
```{stata}
graph pie, over(var1) by(var2)
```

```{stata}
graph pie, over(diag) plabel(_all percent,size(*1.1) format(%4.1g) color(white)) legend(size(vsmall)) legen(rows(4)) plotregion(lstyle(none)) graphregion(fcolor(white)) title("Distribusi Diagnosa Pasien") subtitle("kelompok A FETP 2024") note("data merupakan data laboratory exercise 2")
```

## bar chart
graph ini dapat digunakan untuk melihat frekuensi antar kategori dan juga untuk melihat pengaruh intervensi. bar chart juga bisa untuk menyajikan perubahan overtime

**bar** untuk column chart (nilai di vertikal y)
**hbar** untuk bar chart (nilai di horizontal x)

```{stata}
graph bar var1
```

```{stata}
graph hbar var1
```

kamu bisa melakukan sorting dengan perintah **sort()** dan **descending** atau **ascending**
```{stata}
graph hbar (mean) jumlahkasus, ///
over(provinsi, sort(1) descending label(labsize(*0.7))) ///
bar(1, color(ebblue))
```
**(mean)** menunjukkan bahwa variabel _jumlahkasus_ akan ditampilkan nilai rata-ratanya. ketentuan ini bisa diganti dengan **(count)** untuk frequency, **(median)** untuk median, dan seterusnya

_for the further exploratory about bar chart, you can visit the following link_ **_https://www.stata.com/manuals/g-2graphbar.pdf_**

## box plot chart
graph ini sangat baik untuk mengidentifikasi distribusi data numerik. graph ini juga efektif untuk identifikasi outlier di batas atas dan batas bawah.

```{stata}
graph hbox var1
graph box var1 if age >55
```
untuk grafik vertikal
```{stata}
graph box var1
```

untuk grafik box plot berdasarkan variabel kategorik dapat menggunakan **over()**
```{stata}
graph box var1 var2 over(var3)
```

## scatter plot graph
graph ini berfungsi untuk melihat distribusi dan sebaran data secara numerik
```{stata}
scatter var1 var2
```

kita juga bisa menambahkan garis untuk melihat kecenderungan dengan menggunakan **lfit**
```{stata}
scatter var1 var2, title("judulnya ini") ytitle("label axis y") xtitle("label axis X") mcolor(navy) || lfit var1 var2, legend(off)
twoway (scatter var1 var2) (lfit var1 var2)
twoway (scatter var1 var2) (lfitci var1 var2)
```
