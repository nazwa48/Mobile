import 'package:flutter/material.dart';
//import  'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pizza_api_nazwa/httphelper.dart';
import 'package:pizza_api_nazwa/models/pizza.dart';
import 'package:pizza_api_nazwa/pizza_detail.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Nazwa Ayunda M',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Flutter JSON Demo -Nazwa Ayunda M'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: callPizzas(),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: (snapshot.data == null) ? 0 : snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: Key(index.toString()),
                    onDismissed: (direction) {
                      HttpHelper httpHelper = HttpHelper();
                      snapshot.data!.removeWhere((element) => element.id == snapshot.data![index].id);
                      httpHelper.deletePizza(snapshot.data![index].id);
                    },
                    child: ListTile(
                      title: Text(snapshot.data![index].pizzaName),
                      subtitle: Text(snapshot.data![index].description + ' - €' + snapshot.data![index].price.toString()),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PizzaDetailScreen(pizza: snapshot.data![index], isNew: false)),
                        );
                      },
                    )
                );
              },
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PizzaDetailScreen(
                pizza: Pizza(id: 0, pizzaName: '', description: '', price: 0.0, imageUrl: ''),
                isNew: true,
              )),
            );
          }
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<List<Pizza>> callPizzas() async {
    HttpHelper httpHelper = HttpHelper();
    List<Pizza> pizzas = await httpHelper.getPizzaList();
    return pizzas;
  }
}