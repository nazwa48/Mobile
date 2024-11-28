import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Nazwa',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StreamHomePage(),
    );
  }

}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;

  late StreamTransformer transformer;

  late StreamSubscription subscription;

  late StreamSubscription subscription2;
    String values = '';

  //  @override
  //   void initState() {
  //   super.initState();
  //   colorStream = ColorStream();
  //   changeColor();
  //  }

  void stopStream(){
    numberStreamController.close();
  }

  @override
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
     Stream stream = numberStreamController.stream.asBroadcastStream();
    // stream.listen((event){
    //   setState(() {
    //     lastNumber = event;
    //   });
    // }).onError((error){
    //   setState(() {
    //     lastNumber = -1;
    //   });
    // });

    // Stream stream = numberStreamController.stream;
    subscription = stream.listen((event){
      setState(() {
        // lastNumber = event;
        values += '$event -';
      });
    });
    // subscription.onError((error){
    //   setState(() {
    //     lastNumber = -1;
    //   });
    // });
    // subscription.onDone((){
    //   print('OnDone was called');
    // });

    subscription2 = stream.listen((event){
      setState(() {
        values += '$event -';
      });
    });

    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink){
        sink.add(value*10);
      },
      handleError: (error, trace, sink){
        sink.add(-1);
      },
      handleDone: (sink) => sink.close(),
    );

      stream.transform(transformer).listen((event){
      setState(() {
        lastNumber = event;
      });
    }).onError((error){
      setState(() {
        lastNumber = -1;
      });
    });
    super.initState();
  }

  void changeColor() async{
    // SOAL 4
    // await for (var eventColor in colorStream.getColors()){
    //   setState(() {
    //     bgColor = eventColor;
    //   });
    // }

    // SOAL 5
    colorStream.getColors().listen((eventColor){
      setState(() {
        bgColor = eventColor;
      });
    });
  }

//   void addRandomNumber() {
//   Random random = Random();
//   int myNum = random.nextInt(10);
//   numberStream.addNumberToSink(myNum);
//   // numberStream.addError();
// }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    // numberStream.addNumberToSink(myNum);
    // numberStream.addError();

    if(!numberStreamController.isClosed){
      numberStream.addNumberToSink(myNum);
    }else{
      setState(() {
        lastNumber = -1;
      });
    }
  }

  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
    subscription.cancel();
  }

  

  // Langkah 2
  // @override
  // Widget build(BuildContext context) {
  //   return Container();
  // }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Nazwa'),
      ),
      body: 
      // Container(
      //   decoration: BoxDecoration(color: bgColor),
      // )
      SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(lastNumber.toString()),
            Text(values),
            ElevatedButton(
              onPressed: ()=>addRandomNumber(),
              child: const Text('New Random Number'),
            ),
             ElevatedButton(
              onPressed: ()=> stopStream(),
              child: const Text('Stop Subscription'),
            ),
          ],
        ),
      ),
    );
  }
      
}

