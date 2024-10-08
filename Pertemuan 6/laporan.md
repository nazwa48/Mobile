# Laporan Praktikum Mobile  Layout dan Navigasi
<table>
<tr>
    <th>Nama</th>
    <td>Nazwa Ayunda Mirrohillah</td>
  </tr>
  <tr>
    <th>NIM</th>
    <td>2241720013</td>
  </tr>
  <tr>
    <th>Kelas/Absn</th>
    <td>3C/20</td>
  </tr>
</table>

# Praktikum 1: Membangun Layout di Flutter
## Langkah 1 : Buat Project Baru
Buatlah sebuah project flutter baru dengan nama layout_flutter. Atau sesuaikan style laporan praktikum yang Anda buat.

## Langkah 1 : Buat Project Baru
Buka file main.dart lalu ganti dengan kode berikut. Isi nama dan NIM Anda di text title.
```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout: Nazwa Ayunda M (2241720013)',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```
Output: 
![alt text](assets/hasilLangkah1.png) 


## Langkah 3: Identifikasi layout diagram

Langkah pertama adalah memecah tata letak menjadi elemen dasarnya:

- Identifikasi baris dan kolom.
- Apakah tata letaknya menyertakan kisi-kisi (grid)?
- Apakah ada elemen yang tumpang tindih?
- Apakah UI memerlukan tab?
- Perhatikan area yang memerlukan alignment, padding, atau borders.

Pertama, identifikasi elemen yang lebih besar. Dalam contoh ini, empat elemen disusun menjadi sebuah kolom: sebuah gambar, dua baris, dan satu blok teks.
![alt text](assets/1.png) 

Selanjutnya, buat diagram setiap baris. Baris pertama, disebut bagian Judul, memiliki 3 anak: kolom teks, ikon bintang, dan angka. Anak pertamanya, kolom, berisi 2 baris teks. Kolom pertama itu memakan banyak ruang, sehingga harus dibungkus dengan widget yang Diperluas.
![alt text](assets/2.png) 

Baris kedua, disebut bagian Tombol, juga memiliki 3 anak: setiap anak merupakan kolom yang berisi ikon dan teks.
![alt text](assets/3.png) 

Setelah tata letak telah dibuat diagramnya, cara termudah adalah dengan menerapkan pendekatan bottom-up. Untuk meminimalkan kebingungan visual dari kode tata letak yang banyak bertumpuk, tempatkan beberapa implementasi dalam variabel dan fungsi.


## Langkah 4: Implementasi title row
Pertama, Anda akan membuat kolom bagian kiri pada judul. Tambahkan kode berikut di bagian atas metode build() di dalam kelas MyApp:
```dart
Widget titleSection = Container(
  padding: const EdgeInsets.all(...),
  child: Row(
    children: [
      Expanded(
        /* soal 1*/
        child: Column(
          crossAxisAlignment: ...,
          children: [
            /* soal 2*/
            Container(
              padding: const EdgeInsets.only(bottom: ...),
              child: const Text(
                'Wisata Gunung di Batu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Batu, Malang, Indonesia',
              style: TextStyle(...),
            ),
          ],
        ),
      ),
      /* soal 3*/
      Icon(
       ...,
        color: ...,
      ),
      const Text(...),
    ],
  ),
);
```

/_ soal 1 _/ Letakkan widget Column di dalam widget Expanded agar menyesuaikan ruang yang tersisa di dalam widget Row. Tambahkan properti crossAxisAlignment ke CrossAxisAlignment.start sehingga posisi kolom berada di awal baris.

/_ soal 2 _/ Letakkan baris pertama teks di dalam Container sehingga memungkinkan Anda untuk menambahkan padding = 8. Teks ‘Batu, Malang, Indonesia' di dalam Column, set warna menjadi abu-abu.

/_ soal 3 _/ Dua item terakhir di baris judul adalah ikon bintang, set dengan warna merah, dan teks "41". Seluruh baris ada di dalam Container dan beri padding di sepanjang setiap tepinya sebesar 32 piksel. Kemudian ganti isi body text ‘Hello World' dengan variabel titleSection seperti berikut:

Jawab Kode Program:
```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 // const MyApp({super.key});
 Widget titleSection = Container(
 padding: const EdgeInsets.all(32.0),
 child: Row(
   children: [
     Expanded(
       /* soal 1*/
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start, // Jawaban Soal 1
         children: [
           /* soal 2*/
           Container(
             padding: const EdgeInsets.only(bottom: 8.0), // Jawaban Soal 2
             child: const Text(
               'Wisata Gunung di Batu',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
           Text(
             'Batu, Malang, Indonesia',
             style: TextStyle(
               color: Colors.grey, // Menggunakan Wrana Abu-Abu
             ),
           ),
         ],
       ),
     ),
     Container(
       padding: const EdgeInsets.all(32.0), // Jawaban Soal 3
       child: Row(
         children: [
            /* soal 3*/
           Icon(
             Icons.star, // Untuk Icon Bintang
             color: Colors.red, // Menggunakan warna merah
           ),
           const Text('41'), 
         ],
       ),
     ),
   ],
 ),
);

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter layout: Nazwa Ayunda M (2241720013)',
     home: Scaffold(
       appBar: AppBar(
         title: const Text('Flutter Layout Demo'),
       ),
       body: Column(
         children: [
           titleSection, // Digunakan untuk menampilkan section yang telat dibuat
         ],
       ),
     ),
   );
 }
}
```
Hasil Running: 
![alt text](assets/hasilSoal123.png)

Penjelasan :
- Soal 1 </br>
    **Kode Program** : </br> ![alt text](assets/soal1.png) </br>
    **Penjelasan** : Meletakkan keyword *Expanded* dimaksudkan agar ukuran widget menyesuaikan ruang yang ada pada halaman. Sedangkan keyword *CrossAxisAlignment.start* bermaksud untuk membuat widget berada pada awal baris.
- Soal 2 </br>
    **Kode Program** : </br> ![alt text](assets/soal2.png) </br>
    **Penjelasan** : Dilakukan set padding menjadi 8 sehingga antara baris satu dan dua memiliki jarak sebesar 8 piksel. Begitu pula warna text kedua diganti menjadi abu-abu.
- Soal 3 </br>
    **Kode Program** : </br> ![alt text](assets/soal3.png) </br>![alt text](assets/soaltiga.png)</br>
    **Penjelasan** : Menambahkan icon star dengan warna merah dan sebuah text '41' serta melakukan pemanggilan titleSection pada widget build.


# Praktikum 2: Implementasi button row
Selesaikan langkah-langkah praktikum berikut ini dengan melanjutkan dari praktikum sebelumnya.

## Langkah 1: Buat method Column \_buildButtonColumn

Bagian tombol berisi 3 kolom yang menggunakan tata letak yang sama—sebuah ikon di atas baris teks. Kolom pada baris ini diberi jarak yang sama, dan teks serta ikon diberi warna primer.

Karena kode untuk membangun setiap kolom hampir sama, buatlah metode pembantu pribadi bernama buildButtonColumn(), yang mempunyai parameter warna, Icon dan Text, sehingga dapat mengembalikan kolom dengan widgetnya sesuai dengan warna tertentu.

lib/main.dart (\_buildButtonColumn)

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ···
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
```
## Langkah 2: Buat widget buttonSection

Buat Fungsi untuk menambahkan ikon langsung ke kolom. Teks berada di dalam Container dengan margin hanya di bagian atas, yang memisahkan teks dari ikon.

Bangun baris yang berisi kolom-kolom ini dengan memanggil fungsi dan set warna, Icon, dan teks khusus melalui parameter ke kolom tersebut. Sejajarkan kolom di sepanjang sumbu utama menggunakan MainAxisAlignment.spaceEvenly untuk mengatur ruang kosong secara merata sebelum, di antara, dan setelah setiap kolom. Tambahkan kode berikut tepat di bawah deklarasi titleSection di dalam metode build():

lib/main.dart (buttonSection)

```dart
Color color = Theme.of(context).primaryColor;

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(color, Icons.call, 'CALL'),
    _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    _buildButtonColumn(color, Icons.share, 'SHARE'),
  ],
);
```

## Langkah 3: Tambah button section ke body

Tambahkan variabel buttonSection ke dalam body seperti berikut
```dart
return MaterialApp(
      title: 'Flutter layout: Nazwa Ayunda M (2241720013)',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout Demo'),
        ),
        body: Column(
          children: [
            titleSection,
             // Digunakan untuk menampilkan section yang telat dibuat
             buttonSection,
          ],
        ),
      ),
    );
```

Output :
![alt text](assets/hasilPark2.png)
- Penjelasan : Pada praktikum kedua, hasil kode program akan menampilkan sebuah baris yang berisi tiga button bernama call, route, dan share.

## Praktikum 3 : Implementasi text section

Selesaikan langkah-langkah praktikum berikut ini dengan melanjutkan dari praktikum sebelumnya.

### Langkah 1: Buat widget textSection

Tentukan bagian teks sebagai variabel. Masukkan teks ke dalam Container dan tambahkan padding di sepanjang setiap tepinya. Tambahkan kode berikut tepat di bawah deklarasi buttonSection:

```dart
Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: const Text(
    'Carilah teks di internet yang sesuai '
    'dengan foto atau tempat wisata yang ingin '
    'Anda tampilkan. '
    'Tambahkan nama dan NIM Anda sebagai '
    'identitas hasil pekerjaan Anda. '
    'Selamat mengerjakan 🙂.',
    softWrap: true,
  ),
);
```
Jawab Kode Program :
```dart
Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

      Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: const Text(
          'Wisata taman bunga Flora Wisata San Terra menawarkan pemandangan bunga-bunga yang indah dan pegunungan. Pengunjung bisa melihat 700 jenis bunga yang membuat swafoto semakin indah. Adapun, berbagai macam spot foto yang bisa ditemukan di sana antara lain, Little Korea, Little Amsterdam, Taman Bunga, dan Rainbow Wisteria.(2241720013/20)'
          ,
          softWrap: true,
        ),
      );
      
      Widget buttonSection = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      );
```

Dengan memberi nilai softWrap = true, baris teks akan memenuhi lebar kolom sebelum membungkusnya pada batas kata.

### Langkah 2: Tambahkan variabel text section ke body

Tambahkan widget variabel textSection ke dalam body
```dart
return MaterialApp(
      title: 'Flutter layout: Nazwa Ayunda M (2241720013)',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout Demo'),
        ),
        body: Column(
          children: [
            titleSection,
             // Digunakan untuk menampilkan section yang telat dibuat
             textSection,
             buttonSection,
             
          ],
        ),
      ),
    );
```

Output :
![alt text](assets/hasilPrak3.png)

## Praktikum 4: Implementasi image section

Selesaikan langkah-langkah praktikum berikut ini dengan melanjutkan dari praktikum sebelumnya.

### Langkah 1: Siapkan aset gambar

Anda dapat mencari gambar di internet yang ingin ditampilkan. Buatlah folder images di root project layout_flutter. Masukkan file gambar tersebut ke folder images, lalu set nama file tersebut ke file pubspec.yaml

```dart
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  assets:
    - img/santera.jpg
```

### Langkah 2: Tambahkan gambar ke body

Tambahkan aset gambar ke dalam body

```dart
Image.asset(
              'images/santera.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
```

BoxFit.cover memberi tahu kerangka kerja bahwa gambar harus sekecil mungkin tetapi menutupi seluruh kotak rendernya.

### Langkah 3: Terakhir, ubah menjadi ListView

Pada langkah terakhir ini, atur semua elemen dalam ListView, bukan Column, karena ListView mendukung scroll yang dinamis saat aplikasi dijalankan pada perangkat yang resolusinya lebih kecil.
```dart
return MaterialApp(
      title: 'Flutter layout: Nazwa Ayunda M (2241720013)',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout Dem'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/santera.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
             textSection,
             buttonSection, // Digunakan untuk menampilkan section yang telat dibuat
             
          ],
        ),
      ),
    );
```

Output :
![alt text](assets/hasilPrak4.png)
