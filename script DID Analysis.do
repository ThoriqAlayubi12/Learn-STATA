*CARA MELAKUKAN DIFFERENCES-IN-DIFFERENCES TEST DI STATA*
** by: Moch. Thoriq Assegaf Al-Ayubi
** diperbarui: 1 September 2024

** Disc: Sumber Referensi Beragam dan menggunakan data dummy yang tersedia secara open-source**

*SET WORKING DIREKTORI
cd "C:\Users\Thoriq Al Ayubi\Documents\output stata"
** link directory diatas dapat diganti/disesuaikan**

*SIMPAN LOG*
log using namafile.smcl

*MEMANGGIL DATA
use "https://dss.princeton.edu/training/Panel101.dta", clear

*SET UP VARIABEL: WAKTU dan PERLAKUAN
**misal tahun diatas 1995 kode 1 dan country diatas 3 kode 1
gen waktu = 0
replace waktu = 1 if year>=1995

gen perlakuan = 0
replace perlakuan=1 if country>3

*****CARA SATU******

*MEMBUAT HASIL INTERAKSI WAKTU DENGAN PERLAKUAN
gen did = waktu*perlakuan

*MEMBUAT NILAI ESTIMASI UNTUK DID
reg y waktu perlakuan did
**liat signifikansi variabel did pada bagian p>|t|

*UJI ASUMSI PARALEL PADA TREND
ssc install lgraph
preserve
collapse (mean) y, by(year perlakuan)
lgraph y year, by(perlakuan) xline(1992)
restore

*****CARA DUA******
reg y waktu##perlakuan
**liat pada bagian "waktu#perlakuan"

*****CARA TIGA******
ssc install diff
diff y t(perlakuan) p(waktu)

*****CARA EMPAT******
gen did=waktu*perlakuan
didregress (y) (did),group(country) time(year)
estat trendplots
estat ptrends
**untuk menambahkan kovariat dalam model
didregress (y x2 x3) (did), group(country) time(year) aeq
**x2 dan x3 sebagai kovariat dalam model

*SIMPAN LOG*
log close

**REFERENCES**
** Mailman School of Public Health, Columbia University. Difference-in-Differences Estimation. Available at: https://www.publichealth.columbia.edu/research/population-health-methods/difference-difference-estimation