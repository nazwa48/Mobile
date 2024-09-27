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
               'Wisata Santera di Batu',
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

      

    return MaterialApp(
      title: 'Flutter layout: Nazwa Ayunda M (2241720013)',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout Demo'),
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
  }
    Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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