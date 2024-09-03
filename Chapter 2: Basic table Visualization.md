# CHAPTER 2: BASIC TABLE VISUALIZATION
hai, Berjumpa lagi dengan aku, Moch. Thoriq Assegaf Al-Ayubi. kali ini kita akan coba mendokumentasikan perihal tabulasi di stata, semoga bermanfaat (masih mendengarkan Bernadya)

## MELIHAT FREKUENSI 1 VARIABEL
tab namavariabel

* melihat distribusi data numerik*
summarize namavariabel
** apabila ingin melihat secara detail seperti distribusi persentil**
summarize namavariabel, detail

*MELIHAT FREKUENSI 2 VARIABEL*
tab variabel1 variabel2
** variabel 1 untuk variabel yang menurun (biasanya exposure) dan variabel 2 untuk variabel yang menyamping (biasanya outcome)**

** melihat persentase by column: berfungsi untuk data case control atau ingin melihat sebaran berdasarkan variabel outcome**
tab variabel1 variabel2,col

** melihat persentase by row: berfungsi untuk data cross sectional atau kohort atau ingin melihat sebaran berdasarkan variabel exposure**
tab variabel1 variabel2,row

**melihat persentase berdasarkan column dan row**
tab variabel1 variabel2, row col freq

**melihat nilai tertentu berdasarkan sub-kategori dalam 1/lebih variabel**
tab variabel,sum(age)
tab variabel1 variabel2,sum(age)
*** yang dilihat berdasarkan kategori variabel adalah karakteristik usia***

* MELIHAT FREKUENSI UNTUK LEBIH DARI 2 VARIABEL, maka akan dibagi menjadi sub-kategori variabel ke 3*
keep if variabel !=.
*** artinya memastikan variabel yang missing sudah dihilangkan***
bysort variabel3: tab variabel1 variabel2
bysort varaibel4 variabel3: tab variabel1 variabel2

* MEMBUAT TABEL SUMMARY*
basetable _none variabel1(c) variabel2(%5.1f,ci) variabel3(c),toxl(namafile.xlsx, namasheet, replace)
** (c) artinya data adalah kategorik. (%5.1f,ci) artinya adalah data numerik dengan 1 angka dibelakang koma dan ditambahkan nilai CI.**
**toxl itu artinya hasil diexport ke format excel, makanya ada ".xlsx"**

*CARA LAIN ADALAH DENGAN PERINTAH tabxml*
use "idhs_balance_table.dta",clear
svyset psu [pw=weight], strata(strata) vce(linearized)
tabxml, dv(variabeldep) ivd (variabel1 variabel2 variabel3) percent(col) labcoln (n=) olines tformat(1) display bold pval pdec(3) chi2 justify(r) order(variabel1 variabel2 variabel3) save("balanceweighted")

**untuk unweight**
tabxml, dv(variabeldep) ivd (variabel1 variabel2 variabel3) percent(col) labcoln (n=) olines tformat(1) display bold pval pdec(3) chi2 sp justify(r) osvy save("balanceunweighted")

***penjelasan rumus diatas
*dv untuk variabel dependen
*ivd untuk variabel independen
*percent untuk menentukan persentasenya column atau row
*display ini untuk menentukan output tabel bisa bold --> bold variabelnya, p-value pdec--> deskripsi datanya, chi2 --> hasil chi square
