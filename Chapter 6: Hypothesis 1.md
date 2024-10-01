# Hypothesis 1

seperti biasa, kuliah Prof Sis.

ketika terdapat sebuah pernyataan hasil penelitian, kita bisa menyadari bahwa hasil penelitian adalah pengujian pada sampel. persoalan selanjutnya adalah apakah hasil tersebut bisa kita inferensi kan kepada populasi yang lebih luas? untuk menjawab hal itu, kita bisa lihat melalui dua hal:
- uji hipotesis (melalui **p-value** dan **nilai hitung berbanding nilai tabel**)
- **confidence interval**

kedua cara itu menjawab isu generalisasi dengan cara yang berbeda namun saling mendukung satu sama lain.

## P-value

adalah **probability yang menunjukkan bahwa H0 kita itu benar**. artinya jika p-value 0,5 artinya jika H0 benar maka kita bisa mengamati sebanyak 50% populasi sesuai dengan H0. semakin kecil p-value (misal 0,001) maka H0 tidak terbukti pada populasi karena hanya 1/1000 sampel yang sama dengan H0. sampel kita akan memberikan gambaran dari populasi (inferensial).

uji hipotesis adalah cara formal untuk melakukan metode scientific dan memprediksi apa yang kamu amati di populasi.

**"_The idea behind hypothesis testing and p-values is that a theory should be rejected if the data are too far away from what the theory predicts_" -Prof Siswanto**

ada satu kebenaran fundamental dalam metode ilmiah bahwa kita dapat benar benar membuktikan hipotesis dengan setuju/tidak setuju hipotesis tersebut. kita menciptakan H0 dan kita akan membuktikan bahwa H0 kita itu ditolak. **kenapa? karena segalanya adalah benar sampai ada yang membuktikan bahwa itu salah.**

keuntungan p-value adalah selalu memiliki interpretasi yang sama karena domainnya adalah probabilitas yaitu dari 0-1. keterbatasannya adalah tidak bisa menggambarkan detail perbedaan (plus minus dsb). itulah kenapa kita membutuhkan yang namanya confidence interval. 

satu ketetapan yang harus kita lakukan dari 9 kriteria Hill adalah **konsistensi temuan di lapangan**.

## Kriteria Hill

Teori Kriteria Hill Epidemiologi merupakan sekelompok teori untuk mendukung hubungan antara sebab dan akibat dalam suatu penelitian di bidang epidemiologi kesehatan masyarakat. Kriteria Hill ini diciptakan oleh ahli epidemiologi Inggris Sir Austin Bradford Hill pada tahun 1965 melalui artikel prosiding yang berjudul “The Environtment and Disase: Association or Causation?”.

Terdapat 9 Teori Kriteria Hill Epidemiologi yaitu:

### Strength of Association (Kekuatan Hubungan)
Besarnya angka dapat menunjukkan hubungan antara paparan atau sebab dengan kejadian suatu penyakit. Semakin kuat hubungan dapat ditunjukkan dengan angka yang dihasilkan semakin besar sehingga hubungan tersebut bersifat kausalitas. Kekuatan hubungan antara pajanan dan kejadian penyakit dapat dilihat dari nilai RR Resiko Relatif), OR (Odds Ratio), dan nilai p masing-masing studi.

### Consistency of the Observed Association (Konsisten)
Suatu hasil penelitian memiliki nilai konsisten jika dilaksanakan pada waktu, tempat, populasi, dan juga peneliti yang berbeda. Selain itu, desain penelitian yang dipakai juga harus berbeda. Kriteria konsistensi bersifat mutlak untuk menunjukkan sebuah penelitian bersifat kausalitas (berhubungan)

### Specifity (Spesifitas)
Paparan yang semakin spesifik menyebabkan penyakit tertentu akan menunjukkan semakin kuatnya hubungan antara paparan dengan suatu kejadian penyakit. Satu paparan atau penyebab ditujukan hanya untuk satu penyakit agar bersifat kausalitas

### Temporality (Hubungan temporal)
Suatu faktor atau penyebab atau paparan harus berlangsung atau ada sebelum terjadinya suatu penyakit sehingga dapat bersifat kausalitas.

### Biological Gradien (Respon Dosis)
Kriteria ini dapat juga disebut dengan dose-response relationship. Besar kecilnya dosis obat atau intervensi atau paparan yang diberikan kepada efek akan menunjukkan kuat lemahnya hubungan antara paparan dan efek yang dihasilkan.

### Biological Plausibility (Kelayakan Biologis)
Hubungan kausalitas antara paparan dan efek harus dapat dijelaskan secara biologis. Hubungan tersebut harus dapat dijelaskan secara runtut sehingga dapat menimbulkan suatu kejadian penyakit.

### Coherence (Koherensi)
Hubungan antara paparan dan efek yang terjadi dapat dibuktikan sesuai dengan fakta dan logika mengenai penyakit tersebut. Sebuah penelitian dapat dikatakan koheren atau bertalian apabila penelitian tersebut tidak bertentangan dengan fakta atau kenyataan yang sudah terjadi secara umum

### Experimental Evidence (Bukti Percobaan)
Suatu penelitian yang menggunakan desain penelitian eksperimental dapat menmbuktikan hubungan kausalitas melalui medical record trial, intervensi, dan studi pada hewan. Kemungkinan kausalitas yang dihasilkan akan semakin kuat apabila menggunakan desain penelitian eksperimental ini.

### Analogy (Analogi)
Hubungan kausalitas yang sudah dapat dibuktikan sebelumnya dengan kondisi yang relative sama dapat dianalogikan memiliki tingkat kausalitas yang sama jika memiliki karakteristik yang hampir sama (Hill, 1965).

Demikianlah Teori Kriteria Hill Epidemiologi yang biasa digunakan dalam penelitian epidemiologi.

**kembali ke laptop**

interpretasi dikembalikan kepada pembaca dalam memahami sebuah hasil penelitian, termasuk dalam memperhatikan faktor lainnya, bias persepsi dan diagnostik, dkk. dalam membaca sebuah hasil penelitian, penting bagi kita untuk melihat metodologi secara keseluruhan. 

## fisher's scale of evidence

Fisher membuat sebuah cara interpretasi p-value seperti berikut:

![image](https://github.com/user-attachments/assets/9d89d9cf-11af-42ba-b942-5d5180e95339)

melihat hal tersebut, p-value sebaiknya dituliskan karena adanya perbedaan dalam interpretasi hasil/probabilitas.

## Tipe-Tipe Error

![image](https://github.com/user-attachments/assets/c3082018-e95c-4516-927c-ec4abce59900)

![image](https://github.com/user-attachments/assets/b1257404-ebed-4643-9f9a-1ccf9dcc9132)

### error tipe 1 (alfa)

A type I error consists of **rejecting the null hypothesis in a situation where it was true**. artinya sebenarnya A dan B tidak ada hubungan tetapi hasil kita menunjukkan adanya hubungan signifikan. error tipe 1 (alfa) berkaitan dengan tingkat kepercayaan penelitian kita (confidence interval). error tipe 1 wajarnya 5% artinya confidence interval 95%. error tipe 1 biasanya tercipta karena adanya _random error_ yang sejak awal sudah kita sediakan ruang untuk melakukan kesalahan (kesadaran bahwa penelitian kita tidak benar benar random secara merata).

### error tipe 2 (beta)

A type II error consists of **failing to reject the null hypothesis in a situation where it was false**. artinya sebenarnya A dan B ada hubungan tetapi hasil kita menunjukkan tidak adanya hubungan signifikan. error tipe 2 (beta) berkaitan dengan tingkat kekuatan penelitian (power). wajarnya error tipe 2 adalah 20% artinya power penelitian 80%. ketika penelitian memiliki power <80% penelitian kita **kurang nendang** atau tidak berguna. z

dalam dinamika penelitian, hubungan error tipe 1 dan tipe 2 adalah hubungan yang tidak sejalan bersama-sama. penggunaan error tipe 1 dan 2 ini sering berkaitan dengan perhitungan estimasi besar sampel. berkaitan dengan interpretasi yang mudah, maka kesalahan ini dapat diukur sebagaimana berikut:

![image](https://github.com/user-attachments/assets/e9938405-c176-4b42-b384-2fa0bd1682f4)

## Hipotesis Null

adalah hipotesis yang di uji. kenapa? karena manusia tidak memiliki kapasitas untuk menguji Ha. dalam metodologinya, H0 ada untuk dibuktikan apakah penelitian kita bisa menolak H0 tersebut atau gagal menolak. sekali lagi, yang kita buktikan adalah **penolakannya**, bukan penerimaannya atau kebenarannya. kita tidak pernah bisa membuktikan sesuatu itu benar tapi kita bisa membuktikan bahwa sesuatu itu salah.

selain statistical significance, ada juga **clinical significance**. hal ini dapat membantu apakah signifikansi kita adalah suatu realita atau hanya sekedar **random chance factor**.

hati hati juga dalam melakukan framing hasil penelitian: chance factor, confidence interval, estimation.

## langkah-langkah uji hipotesis

![image](https://github.com/user-attachments/assets/ee1f0f46-bb07-492c-9788-5d8099368777)





