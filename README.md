# Pattern-Recognition-and-ANN
Using pattern recognition and Artificial Neural Network for controlling vehicle in 3D Games.

## HOW IT WORKS
### Image Processing
![alt_text](http://teemstudios.net/wp-content/uploads/2019/04/flowchart.png)

Perancangan sistem dalam proyek ini seperti yang di gambarakan pada gambar diatas. Pertama vidio dari webcam dan video per frame diolah agar mengenali warna hitam untuk di deteksi lalu mengenali bentuk polanya lalupola tersebut diubah menjadi perintah lalu dijadikan keluaran dari program. Sebagai contoh adalah webcam menangkap gambar dan melihat warna hitam, warna hitam tersebuat akan di diteksi dan di lakukan pengecekan pola apakah bentuk pola tersebut  misalnya bulat, segitiga dan sebaginya. Setelah itu dari pola tersebut dijadikan sebuah perintah misal bila pola bulat maka hasilnya adalah belok kiri.

### Artificial Neural Network (Pattern Recognition)
![alt_text](http://teemstudios.net/wp-content/uploads/2019/04/train.png)

Untuk bisa mengenali pola suatu bentuk, maka perlu dilakukan pelatihan data agar bisa mengenali bentuk atau pola suatu objek. Pada projek kali ini kami menggunakan data latih berupa gambar dengan pola berbeda-beda dengan jumlah 60 file yang berwarna hitam putih. Data input yang digunakan berupa nilai metric dan eccentricity dari pola tersebut. Berikut ini adalah pola-pola yang digunakan sebagai data latih.

![alt_text](http://teemstudios.net/wp-content/uploads/2019/04/pola.jpg)

Bentuk dari pola diatas dilatih sedemikian rupa dengan data target tertentu agar dapat mengenali pola-pola yang ada.

### Pattern Recognition to Command

Image yang di terima akan di olah dan menjadi input dan di ubah menjadi perintah dalam matlab dengan menggunakan  java.awt.Robot. Java.awt.ini digunakan untuk mengubah perintah gambar menjadi sebuah perintah untuk menekan tombol pada keyboard, misialnya jika pada kamera di perlihatkan gambar segilima maka akan otomatis menekan tombol w atau dalam game adalah perintah untuk mundur.

![alt_text](http://teemstudios.net/wp-content/uploads/2019/04/rule.jpg)

Akan lebih terlihat dalam tabel jika dalam parameter 0 maka akan menekan tombol w dan a, parameter 3 akan menekan tombol w, parameter 4 akan menekan tombol w dan d, lalu yang terakhir adalah parameter 5 yang menekan tombol s saja.

Note : **Further Explanation read "Computer Vision.pdf"**

## HOW TO USE
You could to use every games, the important things is command to move should be same. for example forward is W, backward is S, Left is A, and Right is D. I used **Beam.NG Simulator**.
Follow this following step:
1. Run cvTrain.m,
```
[akurasi, target] = cvTrain
```
2. Run cvTest.m,
```
img = imread('ex_shape.jpg');
cvTest(img)
```
3. Run main.m,
4. Choose Camera configuration, there are 2 option: Otomatis (Auto) or Manual.

## More
Chat on Whatsapp (62)857 9500 2903
