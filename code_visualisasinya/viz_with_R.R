## Data Visualization in Data Science
## TARGET: 
# 1. understanding ggplot2 for visualization
# 2. implement ggplot2 for visualization

######### PLOTTING #########
# 1. Membuat Kanvas kosong
library(ggplot2)
#Ketik function ggplot() di bawah ini
ggplot()

#Penambahan judul dengan menggunakan fungsi labs
ggplot() + 
  labs(title="Luas Wilayah vs Kepadatan Penduduk DKI Jakarta-Periode 2013",
       x = 'Kepadatan Jiwa', y = 'Luas Wilayah') +
  theme(plot.title = element_text(hjust = 0.5),
        text = element_text(size = 15))

## plot dengan ada variable
library(ggplot2)
plot.jakarta <- ggplot()
plot.jakarta <- plot.jakarta + 
  labs(title="Luas Wilayah vs Kepadatan Penduduk DKI Jakarta - Periode 2013")
plot.jakarta

# menambahkan sumbu x dan y axis
library(ggplot2)
plot.jakarta <- ggplot()
plot.jakarta <- plot.jakarta + 
  labs(title="Luas Wilayah vs Kepadatan Penduduk DKI Jakarta - Periode 2013", 
                                    subtitle="Tahun 2013")
plot.jakarta <- ggplot() + labs(x="Luas Wilayah(km2)", y="Kepadatan Jiwa per km2")
plot.jakarta

# fungsi summary ggplot
library(ggplot2)
plot.jakarta <- ggplot()
plot.jakarta <- plot.jakarta + labs(title="Luas Wilayah vs Kepadatan Penduduk DKI Jakarta")
plot.jakarta <- plot.jakarta + labs(x = "Luas Wilayah (km2)", y="Kepadatan Jiwa per km2")
summary(plot.jakarta)

# 2. Data dan Aesthetic Mapping 
# explore dengan penduduk dki
#Membaca data csv dan dimasukkan ke variable penduduk.dki
penduduk.dki <- read.csv("https://academy.dqlab.id/dataset/dkikepadatankelurahan2013.csv", sep=",")
# Tampilkan data frame dari kolom " NAMA.KELURAHAN " dan "LUAS.WILAYAH..KM2."
penduduk.dki[c("NAMA.KELURAHAN","LUAS.WILAYAH..KM2.")]
# head datanya penduduk
head(penduduk.dki)
#tail penduduk dki
tail(penduduk.dki)
# melihat columns
colnames(penduduk.dki)

## Masukkan data ke dalam plot dan simpan sebagai variable plot.dki, dan tampilkan summary dari plot tersebut
plot.dki <- ggplot(data=penduduk.dki)
summary(plot.dki)


# memetakan x dan y dan color
library(ggplot2)
#Membaca data csv dan dimasukkan ke variable penduduk.dki
penduduk.dki <- read.csv("https://storage.googleapis.com/dqlab-dataset/dkikepadatankelurahan2013.csv", sep=",")
aes(x = LUAS.WILAYAH..KM2., y=KEPADATAN..JIWA.KM2., color=NAMA.KABUPATEN.KOTA)
summary(plot.dki)

# Menampilkan Plot hasil Mapping
library(ggplot2)
#Membaca data csv dan dimasukkan ke variable penduduk.dki
penduduk.dki <- read.csv("https://storage.googleapis.com/dqlab-dataset/dkikepadatankelurahan2013.csv", sep=",")
penduduk.dki
plot.dki <- ggplot(data=penduduk.dki, 
                   aes(x = LUAS.WILAYAH..KM2.,  
                       y=KEPADATAN..JIWA.KM2.,  
                       color=NAMA.KABUPATEN.KOTA)) + 
  labs(title = 'Kepadatan Penduduk') +
  theme(plot.title = element_text(hjust = 0.5)) +
  layer(geom = 'point', 
        stat = 'identity',
        position = 'identity')
plot.dki

#3. Layer untuk Grafik Pertama: Scatter Plot


#Menambahkan layer untuk menghasilkan grafik scatter plot
plot.dki + layer(geom = "point", 
                 stat = "identity", 
                 position = "identity")

# bisa juga
#Menambahkan layer scatter plot dengan geom_point
plot.dki + geom_point() # by default

# tambah judul
#Menambahkan Layer dan labels
plot.dki + geom_point() +
  theme(plot.title = element_text(hjust = 0.5)) + # mengatur agar ke tengah
  labs(title="Luas Wilayah vs Kepadatan Penduduk DKI Jakarta", 
       x="Luas Wilayah(km2)", 
       y="Kepadatan Jiwa per km2", 
       color="Nama Kabupaten/Kota")
# 3.histogram

#Menambahkan data dan aesthetic mapping
plot.dki <- ggplot(data=penduduk.dki, aes(x = KEPADATAN..JIWA.KM2.))
plot.dki + geom_histogram(binwidth=10000)

# dengan warna
plot.dki <- ggplot(data=penduduk.dki, aes(x = KEPADATAN..JIWA.KM2.), 
                   aes(fill=NAMA.KABUPATEN.KOTA))

plot.dki + geom_histogram(binwidth = 10000)

## tren dengan line chart
#Membaca data csv dan dimasukkan ke variable inflasi.indo.sing
inflasi.indo.sing<-read.csv("https://storage.googleapis.com/dqlab-dataset/inflasi.csv",sep=",")
inflasi.indo.sing


library(ggplot2)

#Membaca data csv dan dimasukkan ke variable inflasi.indo.sing
inflasi.indo.sing <- read.csv("https://storage.googleapis.com/dqlab-dataset/inflasi.csv",sep=",")

#Menambahkan data dan aesthetic mapping
plot.inflasi <- ggplot(data=inflasi.indo.sing, aes(x = Bulan,  y=Inflasi,  color=Negara))

#Menambahkan layer
plot.inflasi + geom_line()

# Grouping
library(ggplot2)

#Membaca data csv dan dimasukkan ke variable inflasi.indo.sing
inflasi.indo.sing <- read.csv("https://storage.googleapis.com/dqlab-dataset/inflasi.csv",
                              sep=",")

#Menambahkan data dan aesthetic mapping
plot.inflasi <- ggplot(data=inflasi.indo.sing, 
                       aes(x = Bulan,  y=Inflasi,  
                           color=Negara, group=Negara))

#Menambahkan Layer
plot.inflasi + geom_line()

# memperbaiki urutan
#Membaca data csv dan dimasukkan ke variable inflasi.indo.sing
inflasi.indo.sing <-read.csv("https://storage.googleapis.com/dqlab-dataset/inflasi.csv",sep=",")
inflasi.indo.sing$Bulan = inflasi.indo.sing$Bulan <- factor(inflasi.indo.sing$Bulan, levels = c("Jan-2017", "Feb-2017", "Mar-2017", "Apr-2017","May-2017", "Jun-2017", "Jul-2017", "Aug-2017", "Oct-2017"))

str(inflasi.indo.sing)

# plotiing
#Membaca data csv dan dimasukkan ke variable inflasi.indo.sing
inflasi.indo.sing <- read.csv("https://storage.googleapis.com/dqlab-dataset/inflasi.csv",sep=",")

inflasi.indo.sing$Bulan = factor(inflasi.indo.sing$Bulan, 
                                 levels = c("Jan-2017", "Feb-2017", 
                                            "Mar-2017", "Apr-2017", 
                                            "May-2017", "Jun-2017", 
                                            "Jul-2017", "Aug-2017", 
                                            "Sep-2017", "Oct-2017"))
#Menambahkan data dan aesthetic mapping
plot.inflasi <- ggplot(data=inflasi.indo.sing, aes(x = Bulan,  
                                                   y=Inflasi,  
                                                   color=Negara, 
                                                   group = Negara))
#Menambahkan Layer dan labels
plot.inflasi + geom_line() + geom_text(aes(label=Inflasi),
                                       hjust=-0.2, vjust=-0.1) +
  labs(title = "Inflasi Indonesia dan Singapura", hjust = 0.5) + 
  theme(plot.title = element_text(hjust = 0.5))




# Barchartsimple
#Membaca data csv dan dimasukkan ke variable penduduk.dki
penduduk.dki <- read.csv("https://storage.googleapis.com/dqlab-dataset/datakependudukandki-dqlab.csv",
                         sep=",")
plot.dki <- ggplot(data=penduduk.dki,aes(x=NAMA.KABUPATEN.KOTA))
plot.dki+geom_bar() # namplin distribusi aja

# Aesthetic Y dan Identity
plot.dki <- ggplot(data=penduduk.dki, aes(x = NAMA.KABUPATEN.KOTA, y = JUMLAH))

#Menambahkan layer pada plot
plot.dki + geom_bar(stat="identity")


# diberi pewarnaan 
#Bagian plot
plot.dki <- ggplot(data=penduduk.dki, aes(x = NAMA.KABUPATEN.KOTA,
                                          y=JUMLAH, fill= JENIS.KELAMIN))

#Bagian penambahan layer
plot.dki + geom_bar(stat="identity", position="dodge")

## #Melakukan agregasi
aggregate(x=list(JUMLAH=penduduk.dki$JUMLAH), 
          FUN=sum, 
          by = list(NAMA.KABUPATEN.KOTA=penduduk.dki$NAMA.KABUPATEN.KOTA, 
                    JENIS.KELAMIN=penduduk.dki$JENIS.KELAMIN))

#Plot grafik
p <- aggregate(x=list(JUMLAH=penduduk.dki$JUMLAH),
               FUN=sum, 
               by = list(NAMA.KABUPATEN.KOTA=penduduk.dki$NAMA.KABUPATEN.KOTA,
                         JENIS.KELAMIN=penduduk.dki$JENIS.KELAMIN))

#Plot grafik
plot.dki <- ggplot(data=p, aes(x = NAMA.KABUPATEN.KOTA, 
                               y=JUMLAH,
                               fill=JENIS.KELAMIN, label = JUMLAH))
plot.dki <- plot.dki + geom_bar(stat="identity", position="dodge")  
plot.dki <- plot.dki + labs(title="Jumlah Penduduk DKI Jakarta Umur > 35 - Tahun 2013", 
                            x="Kabupaten / Kota", 
                            y="Jumlah Penduduk")
plot.dki <- plot.dki + theme(axis.text.x = element_text(angle=45,vjust = 0.7), 
                             plot.title = element_text(hjust=0.5))
plot.dki <- plot.dki + geom_text(position = position_dodge(1.5))
plot.dki



#### PIE CHART
#Melakukan agregasi
p <- aggregate(x=list(JUMLAH=penduduk.dki$JUMLAH),
               FUN=sum, 
               by = list(NAMA.KABUPATEN.KOTA=penduduk.dki$NAMA.KABUPATEN.KOTA))
#Plot grafik pie chart
plot.dki <- ggplot(data=p, aes(x="", 
                               y=JUMLAH, 
                               fill = NAMA.KABUPATEN.KOTA))

plot.dki <- plot.dki + geom_bar(width = 1, 
                                stat = "identity")
plot.dki <- plot.dki + coord_polar("y", 
                                   start=0)
plot.dki

## untuk menampilkan value pie chart pake library scale
# http://www.sthda.com/english/wiki/ggplot2-pie-chart-quick-start-guide-r-software-and-data-visualization



# faceting
library(ggplot2)

#Membaca data csv dan dimasukkan ke variable penduduk.dki
penduduk.dki <- read.csv("https://storage.googleapis.com/dqlab-dataset/datakependudukandki-dqlab.csv", sep=",")

#Menambahkan data dan aesthetic mapping
#Menambahkan layer
plot.dki <- ggplot(data=penduduk.dki, 
                   aes(x = LUAS.WILAYAH..KM2., 
                       y=KEPADATAN..JIWA.KM2.,  
                       color=NAMA.KABUPATEN.KOTA))

#Menambahkan layer
plot.dki <- plot.dki + layer(geom = "point", 
                             stat="identity", 
                             position = "identity")
plot.dki <- plot.dki + labs(x="Luas Wilayah (km2)", 
                            y="Kepadatan Jiwa (km2)",
                            color="Kabupaten/Kota")
plot.dki + facet_wrap(~NAMA.KABUPATEN.KOTA,ncol=2)


#Menambahkan data dan aesthetic mapping
plot.dki <- ggplot(data=penduduk.dki, aes(x=KEPADATAN..JIWA.KM2.,  fill=NAMA.KABUPATEN.KOTA))

#Menambahkan layer
plot.dki <- plot.dki + geom_histogram(binwidth=10000)
plot.dki <- plot.dki + labs(title = "Distribusi Kepadatan Jiwa DKI", 
                            x="Kepadatan Jiwa (km2)",
                            y="Jumlah Kelurahan", 
                            color="Kabupaten/Kota")
plot.dki + facet_wrap(~NAMA.KABUPATEN.KOTA, ncol=2) +
  theme(plot.title = element_text(hjust = 0.5))
