* Template untuk uji T Test sekaligus dengan export tabel rapihnya
** ubah directory kerjaan dulu
cd "C:\Users\Thoriq Al Ayubi\Documents\belajar stata"

** pakai data dummy ya
use https://www.stata-press.com/data/r18/nhanes2l

** membuat tabel dengan nama "hasilku"
collect create hasilku

** melihat uji T test antara bpsystol dengan sex berdasarkan variasi race
quietly: collect r(N_1) r(mu_1) r(N_2) r(mu_2) r(p): by race, sort: ttest bpsystol, by(sex)
** gak akan muncul hasil karena kita pakai "quietly"

** membuat layout tabelnya
collect layout (race) (result)
collect label list result

** rename sesuai keterangan variabel sex
collect remap result[N_1 mu_1] = Males
collect remap result[N_2 mu_2] = Females
collect remap result[p] = Difference

** diset up header tabelnya
collect style header Males Females Difference, title(name)
collect layout (race) (Males Females Difference)

** menganti keterangan nilai dalam tabel
collect label levels Males N_1 "N" mu_1 "Mean BP"
 collect label levels Females N_2 "N" mu_2 "Mean BP"
 collect label levels Difference p "p-value"
 
 ** atur layoutnya
collect style column, dups(center) width(equal)
collect style cell, halign(center)
collect style cell Males[mu_1] Females[mu_2] Difference[p], nformat(%6.3f)
collect style cell border_block, border(right, pattern(nil))
collect style cell cell_type[column-header]#Males cell_type[column-header]#Females, border(bottom, pattern(single))
collect preview

** export tabel ke format excel
collect export namatabel.xlsx, name(hasilku) sheet(namasheet) replace
