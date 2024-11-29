import 'package:flutter/material.dart';
import 'package:pizza_api_nazwa/httphelper.dart';
import 'package:pizza_api_nazwa/models/pizza.dart';

class PizzaDetailScreen extends StatefulWidget {
  const PizzaDetailScreen({Key? key}) : super(key: key);

  @override
  _PizzaDetailScreenState createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  final TextEditingController _txtId = TextEditingController();
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtDescription = TextEditingController();
  final TextEditingController _txtPrice = TextEditingController();
  final TextEditingController _txtImageUrl = TextEditingController();

  String operationResult = '';

  @override
  void dispose() {
    _txtId.dispose();
    _txtName.dispose();
    _txtDescription.dispose();
    _txtPrice.dispose();
    _txtImageUrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Detail Nazwa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(operationResult, style: TextStyle(backgroundColor: Colors.green[200], color: Colors.black),),
              const SizedBox(height: 24),
              _textField('Insert ID', _txtId),
              _textField('Insert Pizza Name', _txtName),
              _textField('Insert Description', _txtDescription),
              _textField('Insert Price', _txtPrice),
              _textField('Insert Image URL', _txtImageUrl),
              const SizedBox(height: 24),
              ElevatedButton(
                  onPressed: () {
                    postPizza();
                  },
                  child: const Text('Send Post')
              )
            ],
          ),
        ),
      ),
    );
  }

  Future postPizza() async {
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza(
      id: int.parse(_txtId.text),
      pizzaName: _txtName.text,
      description: _txtDescription.text,
      price: double.parse(_txtPrice.text),
      imageUrl: _txtImageUrl.text,
    );
    String result = await helper.postPizza(pizza);
    setState(() {
      operationResult = result;
    });
  }

  Column _textField(String label, TextEditingController controller) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}