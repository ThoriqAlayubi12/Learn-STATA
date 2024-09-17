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

1. Independen. adalah kondisi dimana hasil **P(AnB) = P(A) x P(B)**
2. Dependen, adalah kondisi dimana kejadian tidak independen. artinya **P(AnB) tidak sama dengan P(A) x P(B)**

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
maka, bayes formula dapat ditugas sebagai
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

## Mutually exclusive event
adalah keadaan dimana event A dan event B adalah dua hal yang benar-benar berbeda. contoh dalam peluang semua dadu, nilai **p(at least one 5)** dengan **p(sum<4)** adalah mutually exclusive karena tidak terikat/beririsan satu sama lain. dengan kata lain, pada kondisi ini, p(AnB) = 0 dengan posisi lingkaran A dan lingkaran B adalah disjoint (tidak saling bersinggungan).

## exhaustive event
adalah kondisi dimana **P(AuB) = 1**

## Mutually exclusive and exhaustive event
adalah konsisi dimana **P(AuB) = 1** dan **P(AnB) = 0**.

untuk lanjutannya, nanti dulu ya, capek aku
