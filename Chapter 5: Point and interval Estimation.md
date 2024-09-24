# Chapter 5: Point and Interval Estimation

kuliah disampaikan oleh Prof. Sis di Auditorium. ditulis setelah makan nasi dadar tempe mie. **Mari belajar!**

dinamika perkembangan kepenulisan ilmiah saat ini mengarah pada penggunaan confidence interval (CI) bahkan pada penyajian data deskriptif.

pada dasarnya, penggunaan nilai p-value pada pengujian hipotesis memiliki celah diantaranya: apabila kita menolak hipotesis, ukuran besaran kuantitatif kadang dipertanyaan. kesimpulan: tidak efektif, maka bisa dipertanyakan, seberapa efektif memang? oleh karena itu, penting untuk penyampaikan **interval**

selain itu, penggunaan interval juga dapat digunakan untuk melihat variasi.

dalam CI 95% misalnya, rentang upper dan lower berkaitan dengan potensi pengulangan prosedur yang sama di populasi akan menunjukkan hasil yang sama sebesar 95%, dan hanya 5% yang hasilnya diluar rentang lower-upper. hal ini juga relevan dengan penggunaan **statistika inferesial** dimana hasil dari sampel dapat menggambarkan keadaan yang ada di populasi. CI adalah _the sort-long-run guarantee_ dalam komunitas kepenulisan ilmiah.

dasar penggunaan probabilitas dalam statistika adalah karena adanya aspek "ketidakpastian" dalam kehidupan yang fanaaaa inii.

## rule of thumb untuk CI

signifikansi point: p-value, ditentukan oleh batas nilai alfa, biasanya 5% atau 0,05. pembagian signifikansi didasarkan pada
- Ho gagal ditolak (p-value > 0,05), artinya H0 yang kita uji berada didalam rentang CI
- Ho ditolak (p-value < 0,05). artinya H0 yang kita uji akan berada diluar rentang CI

dalam penelitian, yang kita buktikan adalah kita berhasil menolak yang tidak kita mau, sehingga pada dasarnya kita tidak perlu membuktikan apa yang kita mau.

signifikansi interval: CI, ditentukan oleh lebar variasi dari lower-upper. CI menjadi inconclusive apabila rentang lower-upper melewati nilai OR=1. selain itu, semakin lebar rentang CI menunjukkan semakin sulit bagi kita untuk memastikan hasil yang mendekati nilai pointnya.

berkaitan dengan hal ini, ada tiga hal yang bisa kita liat:
- nilai CI itu sendiri. variasi yang besar berdampak pada rentang CI yang lebar
- besaran informasi yang kita kumpulkan. semakin besar sampel semakin kondusif rentang CI. hal ini berkaitan dengan optimasi penelitian berdasarkan pada perhitungan besaran sampel
- presisi pengukuran

**review OR sejenak**

OR=1 artinya tidak ada signifikansi atau hubungan

OR>1 artinya adanya **faktor risiko**

OR<1 artinya adanya **faktor protektif**

