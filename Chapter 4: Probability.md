# CHAPTER 4 PROBABILITY

sebentar, ini susah, jadi aku akan coba menuliskan sesederhana mungkin. semoga bermanfaat.

untuk memahami chapter ini, kami butuh untuk membayangkan beberapa skema
- skema dadu dengan 6 bilah sisi yang berbeda
- skema mata uang koin dengan 2 sisi yang berbeda
- diagram venn.
  
 ![Venn-Diagram-Symbols-Image-13](https://github.com/user-attachments/assets/202e109d-f53d-4700-a85d-ca1a0aacacb9)

## Basic Concepts of Probability
probability atau peluang adalah angka yang merefleksikan kesempatan suatu kejadian dapat terjadi. angka ini berkisar antara 0-1 atau 0%-100% dengan skala terendah, 0/0% berarti **tidak ada kesempatan** event/kejadian tersebut terjadi, sedangkan skala tertinggi (1/100%) menunjukkan bahwa kejadian **pasti** terjadi.

## Unconditional Probability
adalah peluang kejadian dengan landasan kriteria secara umum, dan biasanya hanya mengacu pada satu kriteria atau karakteristik.

contoh: peluang laki-laki di sebuah ruang kelas

maka yang dicari adalah

```
P(laki-laki)=jumlah laki-laki/seluruh populasi
```

## conditional probability
adalah peluang yang dihitung dengan fokus pada kelompok tertentu (spesific). biasanya, digunakan dengan notasi tanda **|**

contoh: peluang anak usia 10 tahun pada kelompok jenis kelamin laki-laki

maka yang dicari adalah
```
P(10 tahun | laki-laki) = jumlah laki-laki usia 10 tahun/jumlah laki-laki
P(A | B ) = P(BnA)/P(B)
```
berdasarkan hal tersebut, terdapat dua keadaan yaitu: 1) independen; 2) dependen

### 1. Independen
adalah kondisi dimana hasil
```
P(AnB) = P(A) x P(B)
P(A|B) = P(A)
P(B|A) = P(B)
```
untuk mengecek apakah suatu probability bersifat independence, kita bisa melihat besaran nilai antara conditional probability dengan unconditional probability.

apabila **conditional probability = unconditional probability** maka probability bisa dikatakan **independence**

probability yang independen mengindikasikan bahwa event A dan B tidak saling terkait.

### 2. Dependen
adalah kondisi dimana kejadian tidak independen. artinya **P(AnB) tidak sama dengan P(A) x P(B)**

## Total Probability Theory
adalah kondisi dimana bagian dari event B terbagi dalam beberapa bagian sampling (kondisi A). maka rumus yang bisa digunakan adalah
```
P(B) = P(B|A1) P(A1) + P(B|A2) P(A2) +...+P(B|An) P(An)
```

contoh soal
```
diketahui bahwa suatu pabrik memiliki alat B1,B2, dan B3 dengan kapasitas produksi sebesar 50%,30%,dan20%.
adapun peluang untuk masing-masing alat menghasilkan produk cacat adalah 1%,2%,3%.
berapa peluang untuk menemukan produk yang cacat secara acak?

P(B1)= 50%
P(B2)= 30%
P(B3)= 20%
P(A|B1)= 1%
P(A|B2)= 2%
P(A|B3)= 3%

maka nilai
P(A)= P(B1)P(A|B1) + P(B2)P(A|B2) + P(B3)P(A|B3)
P(A)= 50% x 1% + 30% x 2% + 20% x 3%
P(A)= 0,017 = 1,7%
```
## Bayes' Formula
adalah suatu formula untuk memperbarui hipotesis ketika mendapatkan suatu bukti (kayaknya sih ini ya definisinya)

```
P(A|B)=P(B|A)P(A)/P(B)
```
karena
```
P(B)= P(B|A1) P(A1) + P(B|A2) P(A2) +...+P(B|An) P(An)
```
maka, bayes formula dapat ditulis sebagai
```
P(A|B)=P(B|A)P(A)/P(B|A)P(A) + p(B|A')P(A')
```
contoh yang sama melanjutkan dari contoh sebelumnya, berapa peluang kita menemukan produk cacat pada mesin B1?
```
P(B1|A)=P(A|B1)P(B1)/P(A)
P(B1|A)=(1%x50%)/1,7%
p(B1|A)=0,50%/1,7% = 0,294.
```
sehingga peluang kita menemukan produk cacat pada mesin B1 adalah sebesar 29,4%

contoh lainnya:

![Screenshot_bayes](https://github.com/user-attachments/assets/fda6a3bf-253f-4b36-9e76-b901d4e0cad5)

dari tabel diatas kita bisa tau:

sensitivitas atau P(B|A) = 99/100 = 99%

prevalensi atau P(A) atau unconditional probability of disease = 100/10.000 = 1%

unconditional probability of positive test atau persentase hasil test positif atau P(B) = 198/10.000 = 0,0198

maka bayes formula kemungkinan orang sakit apabila memiliki hasil test positif  = P(A|B) = P(B|A)P(A)/P(B)

= (sensitivitas x prevalensi)/P(B)

= (99%x1%)/0,0198 = 0,50 = 50%. 

angka ini sebenarnya sama dengan nilai **positive predictive value (PPV) yaitu a/(a+b)**

## Mutually exclusive event
adalah keadaan dimana event A dan event B adalah dua hal yang benar-benar berbeda. contoh dalam peluang semua dadu, nilai **p(at least one 5)** dengan **p(sum<4)** adalah mutually exclusive karena tidak terikat/beririsan satu sama lain. dengan kata lain, pada kondisi ini, p(AnB) = 0 dengan posisi lingkaran A dan lingkaran B adalah disjoint (tidak saling bersinggungan).

## exhaustive event
adalah kondisi dimana **P(AuB) = 1**

## Mutually exclusive and exhaustive event
adalah konsisi dimana **P(AuB) = 1** dan **P(AnB) = 0**.

## Binomial Distribution
adalah distribusi pada model probabilitas untuk bentuk keluaran (outcome) data discrete.

persamaan binomial distribution adalah sebagai berikut

![equation_image93](https://github.com/user-attachments/assets/1d660394-ee09-4b45-80ca-9123e2850703)

untuk melakukan binomial distribution ini, ada asumsi/prasyarat yang harus dipenuhi yaitu
1. Setiap replikasi proses menghasilkan satu dari dua kemungkinan hasil (berhasil atau gagal),
2. Peluang keberhasilan adalah sama untuk setiap replikasi, dan
3. Replikasi bersifat independen, artinya di sini keberhasilan pada satu pasien tidak memengaruhi peluang keberhasilan pada pasien lain.

contoh:

Misalkan 80% orang dewasa yang menderita alergi melaporkan adanya perbaikan gejala dengan obat tertentu. Jika obat tersebut diberikan kepada 10 pasien baru yang menderita alergi, berapakah probabilitas bahwa obat tersebut efektif pada tepat tujuh pasien?

jawaban:

```
hasil terdiri dari iya dan tidak, artinya sukses dan tidak sukses
nilai n= 10
p = 80% (dianggap sama untuk semua orang)
event if x = 7 artinya p(7"sukses")
```
coba kerjakan dengan rumus pada gambar diatas

oh iya, funfact, binomial distribution ini bisa dihitung juga di excel dengan fungsi

**=BINOMDIST(x,n,p,FALSE)**

untuk lanjutannya, nanti dulu ya, aku meriang
