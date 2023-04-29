import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _controller = TextEditingController();
  String _fromCurrency = '';
  String _toCurrency = '';
  List<String> _currencies = [];
  String _result = '';

  @override
  void initState() {
    super.initState();
    _fetchCurrencies();
  }

  void _fetchCurrencies() async {
    final response = await http
        .get(Uri.parse('https://openexchangerates.org/api/currencies.json'));
    final data = jsonDecode(response.body);
    setState(() {
      _currencies = data.keys.toList();
      _fromCurrency = _currencies[0];
      _toCurrency = _currencies[1];
    });
  }

  void _convertCurrency() async {
    final response = await http.get(
        Uri.parse('https://api.exchangerate-api.com/v4/latest/$_fromCurrency'));
    final data = jsonDecode(response.body);

    final rate = data['rates'][_toCurrency];
    final amount = double.parse(_controller.text);
    final result = amount * rate;

    setState(() {
      _result = '${result.toStringAsFixed(2)} $_toCurrency';
    });
  }

  bool A = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 30,
                    child: Container(
                      height: 50,
                      child: TextFormField(
                        controller: _controller,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Enter amount',
                          labelText: 'Amount',
                          focusColor: Colors.green,
                          fillColor: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  DropdownButton<String>(
                    value: _fromCurrency,
                    items: _currencies.map((currency) {
                      return DropdownMenuItem(
                        value: currency,
                        child: Text('${currency}'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _fromCurrency = value!;
                      });
                    },
                  ),
                ],
              ),
              Container(
                child: Text(
                  "⇅",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (_controller.text.isNotEmpty) ?
                  Text(
                    _result,
                    style: TextStyle(fontSize: 20),
                  ): Text("Money"),
                  Spacer(),
                  DropdownButton<String>(
                    value: _toCurrency,
                    items: _currencies.map((currency) {
                      return DropdownMenuItem(
                        value: currency,
                        child: Text('$currency'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _toCurrency = value!;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _convertCurrency,
                child: Text('Convert'),
              ),  
            ],
          ),
        ),
      ),
    );
  }
}
